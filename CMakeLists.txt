cmake_minimum_required(VERSION 3.14)

include(cmake/prelude.cmake)

project(
    eisenhowertui
    VERSION 0.1.0
    DESCRIPTION "Simple TUI for tracking todos priority using Eisenhower"
    HOMEPAGE_URL "https://example.com/"
    LANGUAGES CXX
)

include(cmake/project-is-top-level.cmake)
include(cmake/variables.cmake)

# ---- Declare library ----

add_library(
    eisenhowertui_lib OBJECT
    source/lib.cpp
)

target_include_directories(
    eisenhowertui_lib ${warning_guard}
    PUBLIC
    "\$<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/source>"
)

target_compile_features(eisenhowertui_lib PUBLIC cxx_std_20)

# ---- Declare executable ----

add_executable(eisenhowertui_exe source/main.cpp)
add_executable(eisenhowertui::exe ALIAS eisenhowertui_exe)

set_property(TARGET eisenhowertui_exe PROPERTY OUTPUT_NAME eisenhowertui)

target_compile_features(eisenhowertui_exe PRIVATE cxx_std_20)

target_link_libraries(eisenhowertui_exe PRIVATE eisenhowertui_lib)

# ---- Install rules ----

if(NOT CMAKE_SKIP_INSTALL_RULES)
  include(cmake/install-rules.cmake)
endif()

# ---- Developer mode ----

if(NOT eisenhowertui_DEVELOPER_MODE)
  return()
elseif(NOT PROJECT_IS_TOP_LEVEL)
  message(
      AUTHOR_WARNING
      "Developer mode is intended for developers of eisenhowertui"
  )
endif()

include(cmake/dev-mode.cmake)
