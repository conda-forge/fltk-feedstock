mkdir build
cd build

cmake -GNinja %CMAKE_ARGS%            \
      -D FLTK_BUILD_FLUID=ON          \
      -D FLTK_FLUID_EXECUTABLE=ON     \
      -D FLTK_BUILD_EXAMPLES=OFF      \
      -D FLTK_BUILD_TEST=OFF          \
      -D FLTK_BUILD_SHARED_LIBS=ON    \
      -D GENERATE_EXPORT_HEADERS=ON   \
      -D FLTK_BUILD_FORMS=ON          \
      -D FLTK_USE_GL=ON               \
      -D FLTK_BUILD_SHARED_LIBS=ON    \
      %SRC_DIR%

ninja -j${CPU_COUNT} install
