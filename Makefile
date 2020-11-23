all: image 
	docker run -it --mount type=bind,source=$(shell pwd),target=/work nk/debian-image 

build:
	build-simple-cdd --force-root --profiles nk --build-profiles nk --auto-profiles nk --force-preseed
	cp images/debian-10-amd64-CD-1.iso nitrokey-debian-oem.iso
	make clean
	@echo "image: ./nitrokey-debian-oem.iso"

image:
	docker build -t nk/debian-image .

clean:
	rm -rf tmp images


