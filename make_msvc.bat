setlocal
set VIM_SRC=%CD%\..\vim
set OUTDIR=%CD%\bin
set Include=%Include%;"C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include"

set USERNAME=electron226
set USERDOMAIN=electron226@gmail.com

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
set LUA=F:\local\LuaJIT-2.0.3
set DYNAMIC_LUA=yes
set LUA_VER=51

:: Lua
::set LUA=F:\local\lua
::set DYNAMIC_LUA=yes
::set LUA_VER=52

:: set PERL=C:\Perl64
:: set PERL_VER=516
:: set PERLLIB=C:\Perl64\lib
:: set DYNAMIC_PERL=yes

set PYTHON=C:\tools\Python2
set PYTHON_VER=27
set DYNAMIC_PYTHON=yes
set PYTHON3=C:\tools\Python
set PYTHON3_VER=34
set DYNAMIC_PYTHON3=yes

:: RUBY set source code of it.
set RUBY=F:\Source\ruby
set DYNAMIC_RUBY=yes
set RUBY_VER=20
set RUBY_VER_LONG=2.0.0
set RUBY_INSTALL_NAME=x64-msvcrt-ruby$(RUBY_API_VER)
set RUBY_PLATFORM=x64-mswin64_120
set RUBY_INC=/I "$(RUBY)\include" /I "$(RUBY)\win32\.ext\include\$(RUBY_PLATFORM)"

:: ActiveScriptRuby
:: set RUBY_PLATFORM=i386-mswin32_100
:: set RUBY_INSTALL_NAME=msvcr100-ruby191

del /Q bin
rmdir bin

md bin
copy iconv.dll bin
:: Makefile with LUAJIT.
copy Make_mvc.mak %VIM_SRC%\src
cd %VIM_SRC%\src

:: Clean
nmake -f Make_mvc.mak GUI=yes clean CPU=AMD64 ARCH=x86-64
nmake -f Make_mvc.mak GUI=no  clean CPU=AMD64 ARCH=x86-64

:: GUI x64
nmake -f Make_mvc.mak GUI=yes OLE=yes FEATURES=HOGE CPU=AMD64 ARCH=x86-64

:: console x64
nmake -f Make_mvc.mak GUI=no OLE=yes FEATURES=HOGE CPU=AMD64 ARCH=x86-64

copy *.exe "%OUTDIR%"
copy .\GvimExt\*.dll "%OUTDIR%"
copy *.dll "%OUTDIR%"
copy .\xxd\*.exe "%OUTDIR%"

::xcopy /V /E /Y %VIM_SRC%\runtime\* "%OUTDIR%\runtime\"

cd ..

endlocal
