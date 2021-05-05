mkdir build
cd build

cmake -G "NMake Makefiles" ^
      -DCMAKE_INSTALL_PREFIX="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE=Release ^
      -DOPTION_BUILD_SHARED_LIBS=on ^
      %SRC_DIR%
if errorlevel 1 exit 1

:: Build.
nmake
if errorlevel 1 exit 1

:: Test.
ctest
if errorlevel 1 exit 1

:: Install.
nmake install
if errorlevel 1 exit 1

move %LIBRARY_LIB%\fltk.lib %LIBRARY_LIB%\fltk_static.lib
move %LIBRARY_LIB%\fltk_forms.lib %LIBRARY_LIB%\fltk_forms_static.lib
move %LIBRARY_LIB%\fltk_images.lib %LIBRARY_LIB%\fltk_images_static.lib
move %LIBRARY_LIB%\fltk_gl.lib %LIBRARY_LIB%\fltk_gl_static.lib

move %LIBRARY_LIB%\fltk_SHARED.lib %LIBRARY_LIB%\fltk.lib
move %LIBRARY_LIB%\fltk_forms_SHARED.lib %LIBRARY_LIB%\fltk_forms.lib
move %LIBRARY_LIB%\fltk_images_SHARED.lib %LIBRARY_LIB%\fltk_images.lib
move %LIBRARY_LIB%\fltk_gl_SHARED.lib %LIBRARY_LIB%\fltk_gl.lib
