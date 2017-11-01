# The module defines the following variables:
#  DOPE_FOUND - the system has DoPE
#  DOPE_INCLUDE_DIR - where to find DoPE.h
#  DOPE_INCLUDE_DIRS - DoPE includes
#  DOPE_LIBRARY - where to find the DoPE library
#  DOPE_LIBRARIES - aditional libraries
#  DOPE_ROOT_DIR - root dir (ex. /usr/local)

find_path ( DOPE_INCLUDE_DIR
  NAMES DoPE.h
  HINTS ${QT_INCLUDE_DIR}
  PATHS c:/doli/DoPEV2/Include
  PATH_SUFFIXES dope
)

set ( DOPE_INCLUDE_DIRS ${DOPE_INCLUDE_DIR} )

find_library ( DOPE_LIBRARY
  NAMES DoPE
  HINTS ${QT_LIBRARY_DIR}
  PATHS c:/doli/DoPEV2/DoPE
)

set ( DOPE_LIBRARIES ${DOPE_LIBRARY} )

# try to guess root dir from include dir
if ( DOPE_INCLUDE_DIR )
  string ( REGEX REPLACE "(.*)/include.*" "\\1" DOPE_ROOT_DIR ${DOPE_INCLUDE_DIR} )
# try to guess root dir from library dir
elseif ( DOPE_LIBRARY )
  string ( REGEX REPLACE "(.*)/lib[/|32|64].*" "\\1" DOPE_ROOT_DIR ${DOPE_LIBRARY} )
endif ()

# handle the QUIETLY and REQUIRED arguments
include ( FindPackageHandleStandardArgs )
if ( CMAKE_VERSION LESS 2.8.3 )
  find_package_handle_standard_args( dope DEFAULT_MSG DOPE_LIBRARY DOPE_INCLUDE_DIR )
else ()
  find_package_handle_standard_args( dope REQUIRED_VARS DOPE_LIBRARY DOPE_INCLUDE_DIR  )
endif ()

mark_as_advanced (
  DOPE_LIBRARY 
  DOPE_LIBRARIES
  DOPE_INCLUDE_DIR
  DOPE_INCLUDE_DIRS
  DOPE_ROOT_DIR
)
