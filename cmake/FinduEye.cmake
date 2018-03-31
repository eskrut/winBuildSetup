# The module defines the following variables:
#  UEYE_FOUND - the system has DoPE
#  UEYE_INCLUDE_DIR - where to find DoPE.h
#  UEYE_INCLUDE_DIRS - DoPE includes
#  UEYE_LIBRARY - where to find the DoPE library
#  UEYE_LIBRARIES - aditional libraries
#  UEYE_ROOT_DIR - root dir (ex. /usr/local)

message($ENV{LOCAL_DIR} "${LOCAL_DIR}")

find_path ( UEYE_INCLUDE_DIR
  NAMES uEye.h
  PATHS $ENV{LOCAL_DIR}
  PATH_SUFFIXES uEye/include
)

set ( UEYE_INCLUDE_DIRS ${UEYE_INCLUDE_DIR} )

SET(CMAKE_FIND_LIBRARY_PREFIXES "")
SET(CMAKE_FIND_LIBRARY_SUFFIXES ".lib" ".dll")

find_library ( UEYE_LIBRARY
  NAMES uEye_api
  PATHS $ENV{LOCAL_DIR}
  PATH_SUFFIXES uEye/Lib
)

set ( UEYE_LIBRARIES ${UEYE_LIBRARY} )

# try to guess root dir from include dir
if ( UEYE_INCLUDE_DIR )
  string ( REGEX REPLACE "(.*)/include.*" "\\1" UEYE_ROOT_DIR ${UEYE_INCLUDE_DIR} )
# try to guess root dir from library dir
elseif ( UEYE_LIBRARY )
  string ( REGEX REPLACE "(.*)/lib[/|32|64].*" "\\1" UEYE_ROOT_DIR ${UEYE_LIBRARY} )
endif ()

# handle the QUIETLY and REQUIRED arguments
include ( FindPackageHandleStandardArgs )
if ( CMAKE_VERSION LESS 2.8.3 )
  find_package_handle_standard_args( uEye DEFAULT_MSG UEYE_LIBRARY UEYE_INCLUDE_DIR )
else ()
  find_package_handle_standard_args( uEye REQUIRED_VARS UEYE_LIBRARY UEYE_INCLUDE_DIR  )
endif ()

mark_as_advanced (
  UEYE_LIBRARY 
  UEYE_LIBRARIES
  UEYE_INCLUDE_DIR
  UEYE_INCLUDE_DIRS
 # UEYE_ROOT_DIR
)
