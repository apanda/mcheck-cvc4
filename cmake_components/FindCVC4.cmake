# - Try to find CVC4
# Once done this will define

include(LibFindMacros)

libfind_package(CVC4 CLN)
# Uses a pkg-config file I wrote. I think it should work without said pkg-config file.
libfind_pkg_check_modules(CVC4_PKGCONF cvc4)

find_path(CVC4_INCLUDE_DIR
          NAMES cvc4/cvc4.h
          PATHS ${CVC4_PKGCONF_INCLUDE_DIRS})

find_library(CVC4_MAIN_LIB
             NAMES cvc4
            PATHS ${CVC4_PKGCONF_LIBRARY_DIRS}
)

find_library(CVC4_COMPAT_LIB
             NAMES cvc4compat
            PATHS ${CVC4_PKGCONF_LIBRARY_DIRS}
)

find_library(CVC4_PARSER_LIB
             NAMES cvc4parser
            PATHS ${CVC4_PKGCONF_LIBRARY_DIRS}
)

set(CVC4_PROCESS_INCLUDES CLN_INCLUDE_DIR CVC4_INCLUDE_DIR)
set(CVC4_PROCESS_LIBS CLN_LIBRARIES CVC4_MAIN_LIB CVC4_COMPAT_LIB CVC4_PARSER_LIB)
libfind_process(CVC4)
