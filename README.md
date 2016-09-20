# Kaleidoscope

A toy language using LLVM + Haskell.

[Implementing a JIT Compiler with Haskell and LLVM ( Stephen Diehl )](http://www.stephendiehl.com/llvm/)

# How to execute
* $ docker build -t kaleidoscope .
* $ docker run -it kaleidoscope

* $ ghc Main.hs
* $ ./Main
* $ 100;
* $ def hoge(a) a+2-a+34;
* & hoge(22);



# TIPS
* I noticed sources linked `llvm-general` don't perform in GHCi with messages as follows:

```
<interactive>: /usr/lib/llvm-3.5/lib/libLLVMSupport.a: unhandled ELF relocation(RelA) type 42

ghc: unable to load package `llvm-general-3.5.1.2'
```

* However, compiled binary can execute. So If you can't execute kaleidoscope in GHCi, you can try to compile using `ghc` command.
* ref: https://github.com/fpco/stackage/issues/1459
