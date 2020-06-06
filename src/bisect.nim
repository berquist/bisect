## Bisection algorithms, translated from the Python standard library
## ``bisect`` module.

func bisectRight*[T](a: openArray[T], x: T, lo: int = 0, hi: int = high(a)): int =
  ## Return the index where to insert item ``x`` in array ``a``, assuming
  ## ``a`` is sorted.
  ##
  ## The return value ``i`` is such that all ``e`` in ``a[low(a)..<i]`` have
  ## ``e <= x``, and all ``e`` in ``a[i..high(a)]`` have ``e > x``. So if
  ## ``x`` already appears in the list, ``a.insert(x) FIXME`` will insert just
  ## after the rightmost x already there.
  ##
  ## Optional args ``lo`` (default 0) and ``hi`` (default ``high(a)``) bound
  ## the slice of ``a`` to be searched.
  if lo < low(a):
    raise newException(ValueError, "lo must be non-negative")
  if hi > high(a):
    raise newException(ValueError, "hi must not be greater than high(a)")
  var ilo = lo
  var mid: int
  # This is because the high part of a slice in Python is exclusive, but in
  # Nim it is inclusive.
  var ihi = hi + 1
  while ilo < ihi:
    mid = (ilo + ihi) div 2
    if x < a[mid]:
      ihi = mid
    else:
      ilo = mid + 1
  ilo

func bisectLeft*[T](a: openArray[T], x: T, lo: int = 0, hi: int = high(a)): int =
  ## Return the index where to insert item ``x`` in array ``a``, assuming
  ## ``a`` is sorted.
  ##
  ## The return value ``i`` is such that all ``e`` in ``a[low(a)..<i]`` have
  ## ``e < x``, and all ``e`` in ``a[i..high(a)]`` have ``e >= x``. So if
  ## ``x`` already appears in the list, ``a.insert(x) FIXME`` will insert just
  ## before the leftmost ``x`` already there.
  ##
  ## Optional args ``lo`` (default 0) and ``hi`` (default ``high(a)``) bound
  ## the slice of ``a`` to be searched.
  if lo < low(a):
    raise newException(ValueError, "lo must be non-negative")
  if hi > high(a):
    raise newException(ValueError, "hi must not be greater than high(a)")
  var ilo = lo
  var mid: int
  # This is because the high part of a slice in Python is exclusive, but in
  # Nim it is inclusive.
  var ihi = hi + 1
  while ilo < ihi:
    mid = (ilo + ihi) div 2
    if a[mid] < x:
      ilo = mid + 1
    else:
      ihi = mid
  ilo

func insortRight*[T](a: var seq[T], x: T, lo: int = 0, hi: int = high(a)) =
  ## Insert item ``x`` into sequence ``a``, and keep it sorted assuming ``a``
  ## is sorted.
  ##
  ## If ``x`` is already in ``a``, insert it to the right of the rightmost
  ## ``x``.
  ##
  ## Optional args ``lo`` (default 0) and ``hi`` (default ``high(a)``) bound the
  ## slice of ``a`` to be searched.
  a.insert(x, a.bisectRight(x, lo, hi))

func insortLeft*[T](a: var seq[T], x: T, lo: int = 0, hi: int = high(a)) =
  ## Insert item ``x`` into sequence ``a``, and keep it sorted assuming ``a``
  ## is sorted.
  ##
  ## If ``x`` is already in ``a``, insert it to the left of the leftmost
  ## ``x``.
  ##
  ## Optional args ``lo`` (default 0) and ``hi`` (default ``high(a)``) bound
  ## the slice of ``a`` to be searched.
  a.insert(x, a.bisectLeft(x, lo, hi))
