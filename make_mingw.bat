setlocal

set VIM_SRC=%CD%\..\vim
set OUTDIR=%CD%\Vim

:: path to MinGw64
set MINGW_HOME=E:\local\mingw-w64\x86_64-5.1.0-win32-seh-rt_v4-rev0\mingw64
set PATH=%MINGW_HOME%;%PATH%
set CFLAGS="-IC:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include"

set USERNAME=electron226
set USERDOMAIN=electron226@gmail.com

:: LuaJIT
set LUA=E:\local\LuaJIT-2.0.4
set DYNAMIC_LUA=yes
set LUA_VER=51

:: Lua
::set LUA=E:\local\lua
::set DYNAMIC_LUA=yes
::set LUA_VER=52

:: set PERL=C:\Perl64
:: set PERL_VER=516
:: set PERLLIB=C:\Perl64\lib
:: set DYNAMIC_PERL=yes

set PYTHON=E:\local\python27
set PYTHON_VER=27
set DYNAMIC_PYTHON=yes
set PYTHON3=E:\local\Python34
set PYTHON3_VER=34
set DYNAMIC_PYTHON3=yes

set RUBY=E:\local\Ruby22-x64
set DYNAMIC_RUBY=yes
set RUBY_VER=22
set RUBY_VER_LONG=2.2.0

set PERL=E:\local\Perl64
set DYNAMIC_PERL=yes
set PERL_VER=520

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
