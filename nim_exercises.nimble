# Package information
version = "0.1.0"
author = "Raghav309"
description = "Nim exercise"

# Dependencies
requires "nim >= 2.2.0"
requires "unittest2"

# Tasks
task test, "Run the packages tests!":
    exec "nim c -r --hints:off tests/LinkedList.nim"