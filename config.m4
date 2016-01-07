dnl $Id$
dnl config.m4 for extension zqftool

dnl Comments in this file start with the string 'dnl'.
dnl Remove where necessary. This file will not work
dnl without editing.

dnl If your extension references something external, use with:

PHP_ARG_WITH(zqftool, for zqftool support,
Make sure that the comment is aligned:
[  --with-zqftool             Include zqftool support])

dnl Otherwise use enable:

dnl PHP_ARG_ENABLE(zqftool, whether to enable zqftool support,
dnl Make sure that the comment is aligned:
dnl [  --enable-zqftool           Enable zqftool support])

if test "$PHP_ZQFTOOL" != "no"; then
  dnl Write more examples of tests here...

  dnl # --with-zqftool -> check with-path
  dnl SEARCH_PATH="/usr/local /usr"     # you might want to change this
  dnl SEARCH_FOR="/include/zqftool.h"  # you most likely want to change this
  dnl if test -r $PHP_ZQFTOOL/$SEARCH_FOR; then # path given as parameter
  dnl   ZQFTOOL_DIR=$PHP_ZQFTOOL
  dnl else # search default path list
  dnl   AC_MSG_CHECKING([for zqftool files in default path])
  dnl   for i in $SEARCH_PATH ; do
  dnl     if test -r $i/$SEARCH_FOR; then
  dnl       ZQFTOOL_DIR=$i
  dnl       AC_MSG_RESULT(found in $i)
  dnl     fi
  dnl   done
  dnl fi
  dnl
  dnl if test -z "$ZQFTOOL_DIR"; then
  dnl   AC_MSG_RESULT([not found])
  dnl   AC_MSG_ERROR([Please reinstall the zqftool distribution])
  dnl fi

  dnl # --with-zqftool -> add include path
  dnl PHP_ADD_INCLUDE($ZQFTOOL_DIR/include)

  dnl # --with-zqftool -> check for lib and symbol presence
  dnl LIBNAME=zqftool # you may want to change this
  dnl LIBSYMBOL=zqftool # you most likely want to change this 

  dnl PHP_CHECK_LIBRARY($LIBNAME,$LIBSYMBOL,
  dnl [
  dnl   PHP_ADD_LIBRARY_WITH_PATH($LIBNAME, $ZQFTOOL_DIR/$PHP_LIBDIR, ZQFTOOL_SHARED_LIBADD)
  dnl   AC_DEFINE(HAVE_ZQFTOOLLIB,1,[ ])
  dnl ],[
  dnl   AC_MSG_ERROR([wrong zqftool lib version or lib not found])
  dnl ],[
  dnl   -L$ZQFTOOL_DIR/$PHP_LIBDIR -lm
  dnl ])
  dnl
  PHP_REQUIRE_CXX()
  PHP_SUBST(ZQFTOOL_SHARED_LIBADD)
  PHP_ADD_LIBRARY(stdc++, 1, ZQFTOOL_SHARED_LIBADD)
  CPPFILE="zqftool.cpp zq1.cpp zq2.cpp"
  PHP_NEW_EXTENSION(zqftool,$CPPFILE, $ext_shared)
fi
