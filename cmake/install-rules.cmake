install(
    TARGETS eisenhowertui_exe
    RUNTIME COMPONENT eisenhowertui_Runtime
)

if(PROJECT_IS_TOP_LEVEL)
  include(CPack)
endif()
