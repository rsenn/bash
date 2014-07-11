if [ ! -e configure -o ! -e config.h.in ]; then
	autoconf --force
	#autoreconf --force --verbose
fi

ANDROID_ARM_TOOLCHAIN=/opt/arm-linux-androideabi-4.8

CC=arm-linux-androideabi-gcc
#WFLAGS="-Wall -Wno-uninitialized -Wno-unused -Wno-unused-parameter -Wno-sign-compare"

PATH="$ANDROID_ARM_TOOLCHAIN/bin:$PATH"

SYSROOT=$ANDROID_NDK_ROOT/platforms/android-16/arch-arm

NCURSES_DIR=/opt/arm-linux-androideabi-4.8/sysroot/usr
NCURSES_LIB_DIR=$NCURSES_DIR/lib
NCURSES_INC_DIR=$NCURSES_DIR/include

export CFLAGS="--sysroot $SYSROOT -I$NCURSES_INC_DIR -g -O2"
export LDFLAGS="--sysroot $SYSROOT -L$NCURSES_LIB_DIR"

#export LDFLAGS="-L$ANDROID_ARM_TOOLCHAIN/sysroot/usr/lib -L$ANDROID_NDK_ROOT/platforms/android-16/arch-arm/usr/lib"
#CPPFLAGS="-I$ANDROID_ARM_TOOLCHAIN/sysroot/usr/include -I$ANDROID_NDK_ROOT/platforms/android-16/arch-arm/usr/include $WFLAGS"


bash_cv_printf_declared=yes \
bash_cv_under_sys_siglist=yes \
bash_cv_sys_siglist=yes \
bash_cv_dup2_broken=no \
bash_cv_opendir_not_robust=no \
bash_cv_type_rlimit=long \
bash_cv_getenv_redef=yes \
bash_cv_ulimit_maxfds=no \
bash_cv_getcwd_malloc=yes \
bash_cv_fnm_extmatch=yes \
bash_cv_func_sigsetjmp=yes \
bash_cv_func_strcoll_broken=no \
bash_cv_printf_a_format=no \
bash_cv_pgrp_pipe=no \
bash_cv_must_reinstall_sighandlers=no \
bash_cv_job_control_missing=no \
bash_cv_sys_named_pipes=yes \
bash_cv_unusable_rtsigs=yes \
bash_cv_func_ctype_nonascii=no \
bash_cv_wcontinued_broken=no \
bash_cv_func_snprintf=yes \
bash_cv_func_vsnprintf=yes \
bash_cv_wexitstatus_offset=0 \
CPPFLAGS="$CPPFLAGS $WFLAGS" \
./configure \
	--build=`gcc -dumpmachine` \
	--host=`$CC -dumpmachine` \
	--prefix=/system \
	--disable-rpath \
  --disable-nls \
  --disable-rpath \
  --enable-alias \
  --disable-arith-for-command \
  --disable-bang-history \
  --enable-brace-expansion \
  --enable-command-timing \
  --enable-directory-stack \
  --enable-dparen-arithmetic \
  --disable-help-builtin \
  --enable-history \
  --enable-job-control \
  --disable-net-redirections \
  --enable-process-substitution \
  --disable-progcomp \
  --enable-prompt-string-decoding \
  --enable-readline \
  --enable-select \
  --with-curses \
  --disable-debugger \
  --enable-disabled-builtins \
  --disable-multibyte \
  --without-bash-malloc \
  --disable-strict-posix-default \
  --disable-static-link \
	--enable-progcomp \
  "$@"
