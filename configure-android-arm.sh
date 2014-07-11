if [ ! -e configure -o ! -e config.h.in ]; then
	autoreconf --force --verbose
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
  --disable-select \
  --with-curses \
  --disable-debugger \
  --disable-disabled-builtins \
  --disable-multibyte
