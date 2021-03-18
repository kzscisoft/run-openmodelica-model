#!/usr/bin/bash
if [ -z ${INPUT_VERSION} ]
then
    echo "No OpenModelica version specified."
    exit 1
fi

OPENMODELICA_GIT=https://github.com/OpenModelica/OpenModelica.git
git clone $OPENMODELICA_GIT

if [ -z ${INPUT_VERSION} ]
then
    INPUT_VERSION=$(git describe --tags $(git rev-list --tags --max-count=1) | xargs)
fi

git checkout ${INPUT_VERSION}
cd OMCompiler
autoconf
./configure
make
make install