setlocal

set VIM_SRC=%CD%\..\vim
set OUTDIR=%CD%\Vim

:: path of MinGw64
set MINGW_HOME=D:\local\mingw-w64\x86_64-5.3.0-posix-seh-rt_v4-rev0\mingw64
set PATH=%MINGW_HOME%;%PATH%
set CFLAGS="-IC:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include"

:: path of python3 of miniconda
set MINICONDA3=D:\local\miniconda3

set USERNAME=electron226
set USERDOMAIN=electron226@gmail.com

:: LuaJIT
set LUA=D:\local\LuaJIT-2.0.4
set DYNAMIC_LUA=yes
set LUA_VER=51

:: Lua
::set LUA=D:\local\lua53
::set DYNAMIC_LUA=yes
::set LUA_VER=53

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
copy Make_cyg_ming.mak %VIM_SRC%\src
cd %VIM_SRC%\src

:: Clean
mingw32-make -f Make_ming.mak clean ^
    GUI=yes ^
    OLE=yes ^
    FEATURES=HUGE ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    STATIC_STDCPLUS=yes ^
    IME=yes ^
    DYNAMIC_IME=yes ^
    MBYTE=yes ^
    ICONV=yes ^
    GETTEXT=yes ^
    DEBUG=no

mingw32-make -f Make_ming.mak clean ^
    GUI=no ^
    OLE=yes ^
    FEATURES=HUGE ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    STATIC_STDCPLUS=yes ^
    IME=yes ^
    DYNAMIC_IME=yes ^
    MBYTE=yes ^
    ICONV=yes ^
    GETTEXT=yes ^
    DEBUG=no

:: GUI x64
mingw32-make -f Make_ming.mak ^
    GUI=yes ^
    OLE=yes ^
    FEATURES=HUGE ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    STATIC_STDCPLUS=yes ^
    IME=yes ^
    DYNAMIC_IME=yes ^
    MBYTE=yes ^
    ICONV=yes ^
    GETTEXT=yes ^
    DEBUG=no

:: console x64
mingw32-make -f Make_ming.mak ^
    GUI=no ^
    OLE=yes ^
    FEATURES=HUGE ^
    ARCH=x86-64 ^
    DIRECTX=yes ^
    STATIC_STDCPLUS=yes ^
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
