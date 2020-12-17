import unittest

import bisect

suite "bisect":

  test "precomputed_right":
    check: bisectRight[int]([], 1) == 0
    check: bisectRight([1], 0) == 0
    check: bisectRight([1], 1) == 1
    check: bisectRight([1], 2) == 1
    check: bisectRight([1, 1], 0) == 0
    check: bisectRight([1, 1], 1) == 2
    check: bisectRight([1, 1], 2) == 2
    check: bisectRight([1, 1, 1], 0) == 0
    check: bisectRight([1, 1, 1], 1) == 3
    check: bisectRight([1, 1, 1], 2) == 3
    check: bisectRight([1, 1, 1, 1], 0) == 0
    check: bisectRight([1, 1, 1, 1], 1) == 4
    check: bisectRight([1, 1, 1, 1], 2) == 4
    check: bisectRight([1, 2], 0) == 0
    check: bisectRight([1, 2], 1) == 1
    check: bisectRight([1.0, 2.0], 1.5) == 1
    check: bisectRight([1, 2], 2) == 2
    check: bisectRight([1, 2], 3) == 2
    check: bisectRight([1, 1, 2, 2], 0) == 0
    check: bisectRight([1, 1, 2, 2], 1) == 2
    check: bisectRight([1.0, 1.0, 2.0, 2.0], 1.5) == 2
    check: bisectRight([1, 1, 2, 2], 2) == 4
    check: bisectRight([1, 1, 2, 2], 3) == 4
    check: bisectRight([1, 2, 3], 0) == 0
    check: bisectRight([1, 2, 3], 1) == 1
    check: bisectRight([1.0, 2.0, 3.0], 1.5) == 1
    check: bisectRight([1, 2, 3], 2) == 2
    check: bisectRight([1.0, 2.0, 3.0], 2.5) == 2
    check: bisectRight([1, 2, 3], 3) == 3
    check: bisectRight([1, 2, 3], 4) == 3
    check: bisectRight([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 0) == 0
    check: bisectRight([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 1) == 1
    check: bisectRight([1.0, 2.0, 2.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4, 4], 1.5) == 1
    check: bisectRight([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 2) == 3
    check: bisectRight([1.0, 2.0, 2.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4.0, 4.0], 2.5) == 3
    check: bisectRight([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 3) == 6
    check: bisectRight([1.0, 2.0, 2.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4.0, 4.0], 3.5) == 6
    check: bisectRight([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 4) == 10
    check: bisectRight([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 5) == 10

  test "precomputed_left":
    check: bisectLeft[int]([], 1) == 0
    check: bisectLeft([1], 0) == 0
    check: bisectLeft([1], 1) == 0
    check: bisectLeft([1], 2) == 1
    check: bisectLeft([1, 1], 0) == 0
    check: bisectLeft([1, 1], 1) == 0
    check: bisectLeft([1, 1], 2) == 2
    check: bisectLeft([1, 1, 1], 0) == 0
    check: bisectLeft([1, 1, 1], 1) == 0
    check: bisectLeft([1, 1, 1], 2) == 3
    check: bisectLeft([1, 1, 1, 1], 0) == 0
    check: bisectLeft([1, 1, 1, 1], 1) == 0
    check: bisectLeft([1, 1, 1, 1], 2) == 4
    check: bisectLeft([1, 2], 0) == 0
    check: bisectLeft([1, 2], 1) == 0
    check: bisectLeft([1.0, 2.0], 1.5) == 1
    check: bisectLeft([1, 2], 2) == 1
    check: bisectLeft([1, 2], 3) == 2
    check: bisectLeft([1, 1, 2, 2], 0) == 0
    check: bisectLeft([1, 1, 2, 2], 1) == 0
    check: bisectLeft([1.0, 1.0, 2.0, 2.0], 1.5) == 2
    check: bisectLeft([1, 1, 2, 2], 2) == 2
    check: bisectLeft([1, 1, 2, 2], 3) == 4
    check: bisectLeft([1, 2, 3], 0) == 0
    check: bisectLeft([1, 2, 3], 1) == 0
    check: bisectLeft([1.0, 2.0, 3.0], 1.5) == 1
    check: bisectLeft([1, 2, 3], 2) == 1
    check: bisectLeft([1.0, 2.0, 3.0], 2.5) == 2
    check: bisectLeft([1, 2, 3], 3) == 2
    check: bisectLeft([1, 2, 3], 4) == 3
    check: bisectLeft([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 0) == 0
    check: bisectLeft([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 1) == 0
    check: bisectLeft([1.0, 2.0, 2.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4.0, 4.0], 1.5) == 1
    check: bisectLeft([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 2) == 1
    check: bisectLeft([1.0, 2.0, 2.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4.0, 4.0], 2.5) == 3
    check: bisectLeft([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 3) == 3
    check: bisectLeft([1.0, 2.0, 2.0, 3.0, 3.0, 3.0, 4.0, 4.0, 4.0, 4.0], 3.5) == 6
    check: bisectLeft([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 4) == 6
    check: bisectLeft([1, 2, 2, 3, 3, 3, 4, 4, 4, 4], 5) == 10
