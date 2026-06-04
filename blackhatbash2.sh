#!/bin/bash
mkdir mydirectory
touch mydirectory/myfile
set -x
ls -l mydirectory 
set +x