#!/usr/bin/env bash

VERSION=$1

WD=`pwd`

git clone https://github.com/Ensembl/ensembl-git-tools.git
export PATH=$WD/ensembl-git-tools/bin:$PATH

git ensembl --clone api

git ensembl --checkout --branch release/$VERSION api
