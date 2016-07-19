# Kaleidoscope

A toy language using LLVM + Haskell.

[Implementing a JIT Compiler with Haskell and LLVM ( Stephen Diehl )](http://www.stephendiehl.com/llvm/)

# How to execute
* $ docker build -t kaleidoscope .
* $ docker run -it kaleidoscope

* $ stack ghci
* $ :l Main.hs Lexer.hs Syntax.hs Parser.hs
* $ main
