# The module defines the following variables:
#  LIBFEM_FOUND - the system has DoPE
#  LIBFEM_INCLUDE_DIR - where to find DoPE.h
#  LIBFEM_INCLUDE_DIRS - DoPE includes
#  LIBFEM_LIBRARY - where to find the DoPE library
#  LIBFEM_LIBRARIES - aditional libraries
#  LIBFEM_ROOT_DIR - root dir (ex. /usr/local)

find_path ( LIBFEM_INCLUDE_DIR
  NAMES MkeLib.h
  HINTS ${QT_INCLUDE_DIR}
  PATHS c:/src/libfem/
)

set ( LIBFEM_INCLUDE_DIRS ${LIBFEM_INCLUDE_DIR} )

SET(CMAKE_FIND_LIBRARY_PREFIXES "")
SET(CMAKE_FIND_LIBRARY_SUFFIXES ".lib" ".dll")

find_library ( LIBFEM_LIBRARY
  NAMES libfem
  HINTS ${QT_LIBRARY_DIR}
  PATHS c:/build/libfem/
)

set ( LIBFEM_LIBRARIES ${LIBFEM_LIBRARY} )

# try to guess root dir from include dir
if ( LIBFEM_INCLUDE_DIR )
  string ( REGEX REPLACE "(.*)/include.*" "\\1" LIBFEM_ROOT_DIR ${LIBFEM_INCLUDE_DIR} )
# try to guess root dir from library dir
elseif ( LIBFEM_LIBRARY )
  string ( REGEX REPLACE "(.*)/lib[/|32|64].*" "\\1" LIBFEM_ROOT_DIR ${LIBFEM_LIBRARY} )
endif ()

# handle the QUIETLY and REQUIRED arguments
include ( FindPackageHandleStandardArgs )
if ( CMAKE_VERSION LESS 2.8.3 )
  find_package_handle_standard_args( LIBFEM DEFAULT_MSG LIBFEM_LIBRARY LIBFEM_INCLUDE_DIR )
else ()
  find_package_handle_standard_args( LIBFEM REQUIRED_VARS LIBFEM_LIBRARY LIBFEM_INCLUDE_DIR  )
endif ()

mark_as_advanced (
  LIBFEM_LIBRARY 
  LIBFEM_LIBRARIES
  LIBFEM_INCLUDE_DIR
  LIBFEM_INCLUDE_DIRS
 # LIBFEM_ROOT_DIR
)
