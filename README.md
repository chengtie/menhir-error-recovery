# Example of error recovery with Menhir

- try to parse a formula input
- when an error occur, based on the state/incoming symbol/next token, try to manipulate the stack, complete the AST with fake semantic values
- save error messages with precise locations
- resume the parsing
- continue the process to end of the input
- output a recovered AST and all the error messages

For the demo:

```
make
./parse example.input
```

Try formulas in https://github.com/chengtie/menhir-error-recovery/issues/1