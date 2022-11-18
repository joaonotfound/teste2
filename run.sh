#!/bin/bash

ln -s /workspace ./workspace
cp -r workspace/** ./project
wine c:/lazarus/lazbuild.exe c:/project/project1.lpr
cp -r project/** ./workspace