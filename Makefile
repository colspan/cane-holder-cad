DST_DIR=stl
BUILD_CMD=sudo docker run -u $(id -u):$(id -g) --rm -it -v $(shell pwd):/work -w /work -u $(shell id -u):$(shell id -g) openscad openscad

.PHONY: all clean
default: all

SRC =\
	scad/cylinderpipe-canemount-grabber.scad \
	scad/cylinderpipe-canemount-dish.scad \
	scad/swany-canemount-grabber.scad \
	scad/swany-canemount-dish.scad \
	scad/cane_foot.scad

OBJ = $(addprefix $(DST_DIR)/, $(notdir $(patsubst %.scad,%.stl,$(SRC))))

$(DST_DIR):
	mkdir -p $(DST_DIR)

$(DST_DIR)/%.stl: scad/%.scad
	$(BUILD_CMD) $< -o $@

all: $(OBJ) | $(DST_DIR)

clean:
	@rm -Rf $(DST_DIR)/*.stl
