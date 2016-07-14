from fedora:23

RUN dnf update -y
RUN dnf install -y zsh git vim llvm35 llvm35-devel llvm35-static llvm35-libs ghc ghc-devel cabal-install zlib-devel clang clang-devel

RUN cabal update
RUN cabal install cabal-install
RUN cabal update
RUN cabal install --force-reinstalls --extra-include-dirs=/usr/include/llvm35 --extra-lib-dirs=/usr/lib64/llvm35 llvm-general
RUN cabal install parsec

RUN git clone https://github.com/atton-/kaleidoscope /root/kaleidoscope
WORKDIR /root/kaleidoscope

CMD zsh
