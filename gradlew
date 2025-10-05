#!/usr/bin/env sh

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Add default JVM options here. You can also use JAVA_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=$(basename "$0")

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn() {
    echo "$*"
}

die() {
    echo
    echo "$*"
    echo
    exit 1
}

# OS specific support
cygwin=false
msys=false
darwin=false
case "$(uname)" in
  CYGWIN* ) cygwin=true ;;
  Darwin* ) darwin=true ;;
  MINGW* ) msys=true ;;
esac

# Attempt to set MAX_FD
if ! command -v ulimit >/dev/null 2>&1; then
    warn "Could not set maximum file descriptor limit: ulimit not found"
else
    if [ "$MAX_FD" = "maximum" ]; then
        MAX_FD=$(ulimit -H -n)
        if [ $? -ne 0 ]; then
            warn "Could not query maximum file descriptor limit"
            MAX_FD=256
        fi
    fi
    ulimit -n "$MAX_FD" || warn "Could not set maximum file descriptor limit"
fi

# Locate java executable
if [ -n "$JAVA_HOME" ] ; then
    JAVA_EXEC="$JAVA_HOME/bin/java"
else
    JAVA_EXEC="java"
fi

if ! command -v "$JAVA_EXEC" >/dev/null 2>&1; then
    die "ERROR: JAVA_HOME is not set and no 'java' command found in PATH."
fi

CLASSPATH=$(find "$APP_HOME"/gradle/wrapper -name "gradle-wrapper*.jar" | head -n 1)

exec "$JAVA_EXEC" $DEFAULT_JVM_OPTS $JAVA_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
