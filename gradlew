#!/bin/sh
# Copyright 2015 the original author or authors.

# Gradle wrapper script for Unix-based systems

DIR="$(cd "$(dirname "$0")" && pwd)"
DEFAULT_JVM_OPTS=""
JAVA_OPTS="${JAVA_OPTS:-}"
exec "$DIR/gradle/wrapper/gradle-wrapper.jar" "$@"
