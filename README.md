# Cane holder CAD

The open sourced cane holder CAD files for walkers and [SWANY bags](https://www.swany.co.jp/bag) sold in Japan.
These CAD files are 3D printable.

![cylinderpipe-canemount-grabber](images/cylinderpipe-canemount-grabber.jpg)

![cylinderpipe-canemount-dish](images/cylinderpipe-canemount-dish.jpg)

## How to customize

Adust parameters for each `scad/*.scad` .

## How to build stl files

1. Build docker image to retrive openscad binary `sudo docker build -t openscad .`
2. Run `make`
   - This Makefile calls `sudo` command to run docker container

## License

 - `*.scad` files are licensed under MIT license. (c) 2020 Kunihiko Miyoshi.
 - Generated `*.stl` files are licensed under [CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/deed.ja) .


## Printed examples

![3d-printing-with-cura](images/3d-printing-with-cura.jpg)

![swany-canemount-grabber-printed](images/swany-canemount-grabber-printed.jpg)

![swany-canemount-dish-printed](images/swany-canemount-dish-printed.jpg)
