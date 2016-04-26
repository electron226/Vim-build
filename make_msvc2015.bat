setlocal

set VIM_SRC=%CD%\..\vim
set OUTDIR=%CD%\Vim
set SDK_INCLUDE_DIR=C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include
set CFLAGS=/I"C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\include" /I"C:\Program Files (x86)\Windows Kits\10\Include\10.0.10240.0\ucrt" /I"C:\Program Files (x86)\Windows Kits\8.1\Include\um" /I"C:\Program Files (x86)\Windows Kits\8.1\Include\shared"

:: path of python3 of miniconda
set MINICONDA3=D:\local\miniconda3

set USERNAME=electron226
set USERDOMAIN=electron226@gmail.com

set CPUNR=pentium4
set WINVER=0x0501

:: LuaJIT
set LUA=D:\local\LuaJIT-2.0.4
set DYNAMIC_LUA=yes
set LUA_VER=51

:: Lua
::set LUA=D:\local\lua
::set DYNAMIC_LUA=yes
::set LUA_VER=52

set PYTHON="%MINICONDA3%\envs\py27"
set PYTHON_VER=27
set DYNAMIC_PYTHON=yes
set PYTHON3="%MINICONDA3%"
set PYTHON3_VER=35
set DYNAMIC_PYTHON3=yes

set RUBY=D:\local\Ruby23-x64
set DYNAMIC_RUBY=yes
set RUBY_VER=23
set RUBY_VER_LONG=2.3.0

set PERL=D:\local\Perl64
set DYNAMIC_PERL=yes
set PERL_VER=522

rmdir /S /Q "%OUTDIR%"
md "%OUTDIR%"
copy iconv.dll "%OUTDIR%"
copy libintl.dll "%OUTDIR%"

:: Makefile with LUAJIT.
copy Make_mvc.mak %VIM_SRC%\src
cd %VIM_SRC%\src

:: Clean
nmake -f Make_mvc.mak clean ^
    GUI=yes ^
    OLE=yes ^
    FEATURES=HUGE ^
    CPU=AMD64 ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    IME=yes ^
    DYNAMIC_IME=yes ^
    MBYTE=yes ^
    ICONV=yes ^
    GETTEXT=yes ^
    DEBUG=no

nmake -f Make_mvc.mak clean ^
    GUI=no ^
    OLE=yes ^
    FEATURES=HUGE ^
    CPU=AMD64 ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    IME=yes ^
    DYNAMIC_IME=yes ^
    MBYTE=yes ^
    ICONV=yes ^
    GETTEXT=yes ^
    DEBUG=no

:: GUI x64
nmake -f Make_mvc.mak ^
    GUI=yes ^
    OLE=yes ^
    FEATURES=HUGE ^
    CPU=AMD64 ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    IME=yes ^
    DYNAMIC_IME=yes ^
    MBYTE=yes ^
    ICONV=yes ^
    GETTEXT=yes ^
    DEBUG=no

:: console x64
nmake -f Make_mvc.mak ^
    GUI=no ^
    OLE=yes ^
    FEATURES=HUGE ^
    CPU=AMD64 ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    IME=yes ^
    DYNAMIC_IME=yes ^
    MBYTE=yes ^
    ICONV=yes ^
    GETTEXT=yes ^
    DEBUG=no
    
copy *.exe "%OUTDIR%"
copy .\GvimExt\*.dll "%OUTDIR%"
copy *.dll "%OUTDIR%"
copy .\xxd\*.exe "%OUTDIR%"

xcopy /V /E /Y %VIM_SRC%\runtime\* "%OUTDIR%\runtime\"

cd ..

endlocal
