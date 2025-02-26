import unittest

proc add(a: int, b: int): int =
    return a + b

suite "Addition Tests":
    test "Test adding positive numbers":
        check add(2, 3) == 5

    test "Test adding negative numbers":
        check add(-2, -3) == -5

    test "Test adding zero":
        check add(0, 5) == 5