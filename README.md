# bisect

![nimble version](https://nimble.directory/ci/badges/bisect/version.svg)
![nimble code build status](https://nimble.directory/ci/badges/bisect/nimdevel/status.svg)
![nimble doc build status](https://nimble.directory/ci/badges/bisect/nimdevel/docstatus.svg)

Bisection algorithms ported from Python

## Examples

```nim
import bisect

assert bisectLeft([1, 1, 2, 2], 2) == 2
assert bisectRight([1, 1, 2, 2], 2) == 4
```
