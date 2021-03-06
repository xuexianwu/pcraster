add_subdirectory(local)
add_subdirectory(focal)
add_subdirectory(total)
add_subdirectory(type_conversion)
add_subdirectory(scripts)


set(_SOURCES
    execution_policy
    pcraster_multicore
)

add_library(_pcraster_multicore SHARED ${_SOURCES})

target_include_directories(_pcraster_multicore
  PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/../../pcraster_model_engine
)

configure_python_extension(_pcraster_multicore
    "_pcraster_multicore"
)

target_link_libraries(_pcraster_multicore
    multicore_field_python_totals
    multicore_field_python_focals
    multicore_field_python_locals
    multicore_field_python_type_conversions
    pcraster_model_engine
    _pcraster
    ${Boost_PYTHON_LIBRARY}
    ${Boost_SYSTEM_LIBRARY}
    ${PYTHON_LIBRARIES}
    ${FERN_LIBRARIES}
)

set_target_properties(_pcraster_multicore
    PROPERTIES
        LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin/pcraster/multicore
)
