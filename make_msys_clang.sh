#!/bin/sh

export VIM_SRC=$(pwd)/../vim
export OUTDIR=$(pwd)/bin

# path to MinGw64
export USERNAME=electron226
export USERDOMAIN=electron226@gmail.com

export IME=yes
export DYNAMIC_IME=yes
export MBYTE=yes
export ICONV=yes
export GETTEXT=yes
export DEBUG=no

# DirectWrite
export DIRECTX=yes
export STATIC_STDCPLUS=yes

# LuaJIT
export LUA=F:/local/LuaJIT-2.0.3
export DYNAMIC_LUA=yes
export LUA_VER=51

# Lua
#export LUA=F:/local/lua
#export DYNAMIC_LUA=yes
#export LUA_VER=52

# export PERL=C:/Perl64
# export PERL_VER=516
# export PERLLIB=C:/Perl64/lib
# export DYNAMIC_PERL=yes

export PYTHON=F:/local/Python27
export PYTHON_VER=27
export DYNAMIC_PYTHON=yes
export PYTHON3=F:/local/Python34
export PYTHON3_VER=34
export DYNAMIC_PYTHON3=yes

#export RUBY=C:/tools/ruby213
#export DYNAMIC_RUBY=yes
#export RUBY_VER=21
#export RUBY_VER_LONG=2.1.0
export RUBY=F:/local/Ruby200-x64
export DYNAMIC_RUBY=yes
export RUBY_VER=20
export RUBY_VER_LONG=2.0.0

# ActiveScriptRuby
# export RUBY_PLATFORM=i386-mswin32_100
# export RUBY_INSTALL_NAME=msvcr100-ruby191

rm -fr bin

mkdir bin
cp iconv.dll bin
cp libwinpthread-1.dll bin
# Makefile with LUAJIT.
cp Make_cyg_ming.mak $VIM_SRC/src
cd $VIM_SRC/src

# Clean
make -f Make_ming.mak CC=clang CXX=clang++ GUI=yes clean ARCH=x86-64
make -f Make_ming.mak CC=clang CXX=clang++ GUI=no  clean ARCH=x86-64

# GUI x64
make -f Make_ming.mak CC=clang CXX=clang++ GUI=yes OLE=yes FEATURES=HOGE ARCH=x86-64

# console x64
make -f Make_ming.mak CC=clang CXX=clang++ GUI=no OLE=yes FEATURES=HOGE ARCH=x86-64

cp *.exe $OUTDIR
cp ./GvimExt/*.dll $OUTDIR
cp *.dll $OUTDIR
cp ./xxd/*.exe $OUTDIR

mkdir $OUTDIR/runtime
cp -r -v $VIM_SRC/runtime/* $OUTDIR/runtime

cd ..
