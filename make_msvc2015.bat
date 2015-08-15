setlocal
set VIM_SRC="%CD%\..\vim"
set OUTDIR="%CD%\bin"
set Include="%Include%";"C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include"

set USERNAME=electron226
set USERDOMAIN=electron226@gmail.com

set CPUNR=pentium4
set WINVER=0x0500

set IME=yes
set DYNAMIC_IME=yes
set MBYTE=yes
set ICONV=yes
set GETTEXT=yes
set DEBUG=no

:: DirectWrite
set DIRECTX=yes
set STATIC_STDCPLUS=yes

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

:: RUBY set source code of it.
::set RUBY=E:\local\Ruby22-x64
::set DYNAMIC_RUBY=yes
::set RUBY_VER=22
::set RUBY_VER_LONG=2.2.0
::set RUBY_INSTALL_NAME=x64-msvcrt-ruby$(RUBY_API_VER)
::set RUBY_PLATFORM=x64-mingw32
::set RUBY_INC="/I $(RUBY)\include /I $(RUBY)\include\ruby-$(RUBY_VER_LONG)\x64-mingw32"

set PERL=E:\local\Perl64
set DYNAMIC_PERL=yes
set PERL_VER=520

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
    FEATURES=HOGE ^
    CPU=AMD64 ^
    ARCH=x86-64

nmake -f Make_mvc.mak clean ^
    GUI=no ^
    OLE=yes ^
    FEATURES=HOGE ^
    CPU=AMD64 ^
    ARCH=x86-64

:: GUI x64
nmake -f Make_mvc.mak ^
    GUI=yes ^
    OLE=yes ^
    FEATURES=HOGE ^
    CPU=AMD64 ^
    ARCH=x86-64

:: console x64
nmake -f Make_mvc.mak ^
    GUI=no ^
    OLE=yes ^
    FEATURES=HOGE ^
    CPU=AMD64 ^
    ARCH=x86-64

copy *.exe "%OUTDIR%"
copy .\GvimExt\*.dll "%OUTDIR%"
copy *.dll "%OUTDIR%"
copy .\xxd\*.exe "%OUTDIR%"

xcopy /V /E /Y %VIM_SRC%\runtime\* "%OUTDIR%\runtime\"

cd ..

endlocal
