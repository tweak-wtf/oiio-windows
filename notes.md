## Build from Source Commands

### NASM
curl -o nasm.zip https://www.nasm.us/pub/nasm/releasebuilds/2.16.03/win64/nasm-2.16.03-win64.zip
Expand-Archive -Path .\nasm.zip
$env:PATH += "C:/Users/ContainerAdministrator/nasm/nasm-2.16.03/;"


### JPEG
git clone https://github.com/libjpeg-turbo/libjpeg-turbo
cmake . -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release --target install
$env:PATH += "c:/libjpeg-turbo64/bin;"


### ZLIP
git clone https://github.com/madler/zlib
cmake -S . -B build -DCMAKE_INSTALL_PREFIX=.
cmake --build build --config Release --target install
del build\Release\zlib.lib


### TIFF
git clone https://gitlab.com/libtiff/libtiff.git
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=.
cmake -S . -B libtiff-build -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DCMAKE_INSTALL_PREFIX=.
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF
cmake --build build --config Release --target install


### OpenEXR
git clone https://github.com/AcademySoftwareFoundation/openexr
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=dist -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=OFF -DOPENEXR_BUILD_TOOLS=OFF -DOPENEXR_INSTALL_TOOLS=OFF -DOPENEXR_INSTALL_EXAMPLES=OFF -DZLIB_ROOT=C:\Users\ContainerAdministrator\zlib\build
cmake --build build --target install --config Release


### OpenImageIO
git clone https://github.com/AcademySoftwareFoundation/OpenImageIO
$ZLIB_ROOT = "C:\Users\ContainerAdministrator\zlib"
$TIFF_ROOT = "C:/Users/ContainerAdministrator/libtiff/libtiff"
$EXR_ROOT = "C:\Users\ContainerAdministrator\openexr"
$JPEG_ROOT = "C:\Users\ContainerAdministrator\libjpeg-turbo64"
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DZLIB_ROOT="${ZLIB_ROOT}" -DTIFF_ROOT="${TIFF_ROOT}" -DOpenEXR_ROOT="${EXR_ROOT}\dist" -DImath_DIR="${EXR_ROOT}\dist\lib\cmake\Imath" -DImath_INCLUDE_DIR="${EXR_ROOT}" -DImath_LIBRARY="${EXR_ROOT}\dist\lib\Imath-3_2.lib" -DJPEG_ROOT="${JPEG_ROOT}" -Dlibjpeg-turbo_ROOT="${JPEG_ROOT}" -DUSE_PYTHON=0 -DUSE_QT=0 -DBUILD_SHARED_LIBS=0 -DLINKSTATIC=1
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DZLIB_ROOT="${ZLIB_ROOT}" -DOpenEXR_ROOT="${EXR_ROOT}\dist" -DImath_DIR="${EXR_ROOT}\dist\lib\cmake\Imath" -DImath_INCLUDE_DIR="${EXR_ROOT}" -DImath_LIBRARY="${EXR_ROOT}\dist\lib\Imath-3_2.lib" -DJPEG_ROOT="${JPEG_ROOT}" -Dlibjpeg-turbo_ROOT="${JPEG_ROOT}" -DUSE_PYTHON=0 -DUSE_QT=0 -DBUILD_SHARED_LIBS=0 -DLINKSTATIC=1
cmake . -DVERBOSE=ON -DCMAKE_BUILD_TYPE=Release -DUSE_PYTHON=0 -DUSE_QT=0 -DBUILD_SHARED_LIBS=0 -DLINKSTATIC=1
