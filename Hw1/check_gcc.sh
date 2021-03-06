GCC_MAJOR=`g++ --version | grep ^g++ | sed 's/^.* //g' | awk -F. '{print $1}'`
GCC_MINOR=`g++ --version | grep ^g++ | sed 's/^.* //g' | awk -F. '{print $2}'`
GCCVERSION=`expr $GCC_MAJOR \* 10000 + $GCC_MINOR`
echo using `g++ --version | grep ^g++ `
if [ $GCCVERSION -ge 50000 ]; then
  echo "gcc version is same as or newer than 5.0.0"
else
  echo "Please use gcc 5.0.0+ version"
fi

