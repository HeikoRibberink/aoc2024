# DX improvements

- Allow multiple error messages, instead of just the first.

# Documentation improvements

- Document implicit parameters:

```koka
fun eq(a : a, b : a, ?cmp : (a, a) -> order)
```

- Document the different modifiers on effects:
  1. Linear
  2. Final
  3. Scoped: especially for this one, explain how this can be used.
  4. Named

- Document the module system
- Document kinds
