# Parent project does not export its library target, so this CML implicitly
# depends on being added from it, i.e. the testing is done only from the build
# tree and is not feasible from an install location

project(eisenhowertuiTests LANGUAGES CXX)

# ---- Tests ----

add_executable(eisenhowertui_test source/eisenhowertui_test.cpp)
target_link_libraries(eisenhowertui_test PRIVATE eisenhowertui_lib)
target_compile_features(eisenhowertui_test PRIVATE cxx_std_20)

add_test(NAME eisenhowertui_test COMMAND eisenhowertui_test)

# ---- End-of-file commands ----

add_folders(Test)
