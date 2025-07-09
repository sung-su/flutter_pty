# CMake 툴체인 파일 for Tizen (ARMv7)

# 1. 타겟 시스템 정보 설정
# CMake에게 지금 호스트(PC)가 아닌 다른 시스템용으로 빌드하고 있음을 알립니다.
# 이를 통해 크로스 컴파일 모드가 활성화됩니다.
set(CMAKE_SYSTEM_NAME Tizen)
set(CMAKE_SYSTEM_PROCESSOR armv7l)

# 2. Tizen SDK 경로 및 Sysroot 설정
# !!! 중요 !!!: 이 경로는 사용자의 Tizen Studio 설치 경로에 맞게 반드시 수정해야 합니다.
# Tizen SDK의 Rootstrap 경로는 타겟 시스템의 루트(/) 파일 시스템과 같습니다.
# 모든 헤더와 라이브러리는 이 경로를 기준으로 찾게 됩니다.
set(TIZEN_SYSROOT "~/tizen-studio/platforms/tizen-9.0/tizen/rootstraps/tizen-9.0-device.core")

# CMAKE_SYSROOT 변수에 경로를 설정합니다.
set(CMAKE_SYSROOT ${TIZEN_SYSROOT})

# 3. 크로스 컴파일러 설정
# Tizen SDK에 포함된 C/C++ 크로스 컴파일러의 전체 경로를 지정합니다.
# 컴파일러 경로는 Tizen SDK 버전에 따라 다를 수 있으므로 실제 경로를 확인해야 합니다.
set(CMAKE_C_COMPILER "/usr/bin/arm-linux-gnueabi-gcc")
set(CMAKE_CXX_COMPILER "/usr/bin/arm-linux-gnueabi-g++")

# 4. 검색 경로 설정
# find_package, find_library 등의 명령이 호스트 시스템이 아닌
# CMAKE_SYSROOT 내부에서만 라이브러리와 헤더를 찾도록 강제합니다.
# 이는 크로스 컴파일 시 가장 중요한 설정 중 하나입니다.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# 5. 컴파일러/링커 플래그 (선택 사항)
# 필요에 따라 타겟 아키텍처 지정 등 특정 플래그를 추가할 수 있습니다.
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -march=armv7-a ")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -march=armv7-a ")

