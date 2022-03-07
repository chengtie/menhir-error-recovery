# Example of error recovery with Menhir

- try to parse a formula input
- based on the state of the occurred error, print error messages with precise locations
- try to complete AST with fake tokens and fake semantic values
- continue to end of the input
- output a recovered AST and all the error messages

For the demo:

```
make
./parse example.input
```

Try formulas in https://github.com/chengtie/menhir-error-recovery/issues/1