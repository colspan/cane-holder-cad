# Cane holder CAD

## How to customize

Adust parameters for each `scad/*.scad` .

## How to build stl files

1. Build docker image to retrive openscad binary `sudo docker build -t openscad` .
2. Run `make`
   - This Makefile calls `sudo` command to run docker container
