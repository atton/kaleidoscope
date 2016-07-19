from fedora:23

RUN dnf update -y
RUN dnf install -y zsh git vim llvm35 llvm35-devel llvm35-static llvm35-libs zlib-devel clang clang-devel libedit-devel

RUN curl -sSL https://s3.amazonaws.com/download.fpcomplete.com/fedora/23/fpco.repo | tee /etc/yum.repos.d/fpco.repo
RUN dnf install -y stack
RUN stack setup
RUN stack install llvm-general-3.5.1.2 llvm-general-pure-3.5.1.0

RUN git clone https://github.com/sdiehl/kaleidoscope /root/kaleidoscope-original
RUN git clone https://github.com/atton-/kaleidoscope /root/kaleidoscope
WORKDIR /root/kaleidoscope

CMD zsh
