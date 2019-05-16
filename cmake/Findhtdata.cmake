# The module defines the following variables:
#  HTDATA_FOUND - the system has htdata
#  HTDATA_INCLUDE_DIR - where to find htdata2_diagram.h
#  HTDATA_INCLUDE_DIRS - htdata includes
#  HTDATA_LIBRARY - where to find the htdata library
#  HTDATA_LIBRARIES - aditional libraries
#  HTDATA_ROOT_DIR - root dir (ex. /usr/local)

find_path ( HTDATA_INCLUDE_DIR
  NAMES htdata2_diagram.h
  PATHS $ENV{SRC_DIR}
  PATH_SUFFIXES htData/include
)

set ( HTDATA_INCLUDE_DIRS ${HTDATA_INCLUDE_DIR} )

find_library ( HTDATA_LIBRARY
  NAMES htdata
  PATHS $ENV{BUILD_DIR}
  PATH_SUFFIXES htData
)

find_library ( HTDATA_LIBRARY_DEBUG
  NAMES htdatad
  PATHS $ENV{BUILD_DIR}
  PATH_SUFFIXES htData htDatad
)

set ( HTDATA_LIBRARIES ${HTDATA_LIBRARY} )
set ( HTDATA_LIBRARIES_DEBUG ${HTDATA_LIBRARY_DEBUG} )

# try to guess root dir from include dir
if ( HTDATA_INCLUDE_DIR )
  string ( REGEX REPLACE "(.*)/include.*" "\\1" HTDATA_ROOT_DIR ${HTDATA_INCLUDE_DIR} )
# try to guess root dir from library dir
elseif ( HTDATA_LIBRARY )
  string ( REGEX REPLACE "(.*)/lib[/|32|64].*" "\\1" HTDATA_ROOT_DIR ${HTDATA_LIBRARY} )
endif ()

# handle the QUIETLY and REQUIRED arguments
include ( FindPackageHandleStandardArgs )
if ( CMAKE_VERSION LESS 2.8.3 )
  find_package_handle_standard_args( htdata DEFAULT_MSG HTDATA_LIBRARY HTDATA_INCLUDE_DIR )
else ()
  find_package_handle_standard_args( htdata REQUIRED_VARS HTDATA_LIBRARY HTDATA_LIBRARY_DEBUG HTDATA_LIBRARIES HTDATA_LIBRARIES_DEBUG HTDATA_INCLUDE_DIR  )
endif ()

mark_as_advanced (
  HTDATA_LIBRARY 
  HTDATA_LIBRARIES
  HTDATA_LIBRARY_DEBUG 
  HTDATA_LIBRARIES_DEBUG
  HTDATA_INCLUDE_DIR
  HTDATA_INCLUDE_DIRS
  HTDATA_ROOT_DIR
)
