package com.octopuslog

import android.graphics.Bitmap
import android.graphics.Canvas
import android.os.Bundle
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import com.octopuslog.databinding.ActivitySignatureBinding
import java.io.File
import java.io.FileOutputStream

class SignatureActivity : AppCompatActivity() {

    private lateinit var binding: ActivitySignatureBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignatureBinding.inflate(layoutInflater)
        setContentView(binding.root)

        binding.btnClear.setOnClickListener {
            binding.paintView.clear()
        }

        binding.btnSave.setOnClickListener {
            val bitmap = Bitmap.createBitmap(
                binding.paintView.width,
                binding.paintView.height,
                Bitmap.Config.ARGB_8888
            )
            val canvas = Canvas(bitmap)
            binding.paintView.draw(canvas)

            val folder = File(getExternalFilesDir(null), "Octopus")
            if (!folder.exists()) folder.mkdirs()

            val file = File(folder, "signature.png")
            val stream = FileOutputStream(file)
            bitmap.compress(Bitmap.CompressFormat.PNG, 100, stream)
            stream.flush()
            stream.close()

            Toast.makeText(this, "Подпись сохранена", Toast.LENGTH_SHORT).show()
            finish()
        }
    }
}
