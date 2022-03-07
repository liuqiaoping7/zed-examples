@echo on

set TOP_DIR=%~dp0\
echo %TOP_DIR%
rmdir /q /s %TOP_DIR%test_sdk\windows\
rmdir /q /s %TOP_DIR%build\
if not exist %TOP_DIR%build md %TOP_DIR%build

set Configuration=RelWithDebInfo

cmake -G "Visual Studio 16 2019" -A x64 -DCMAKE_INSTALL_PREFIX=%TOP_DIR%test_sdk/windows -B%TOP_DIR%build\ -H%TOP_DIR%
cmake --build %TOP_DIR%build --config %Configuration% --target install

goto :eof