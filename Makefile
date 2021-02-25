all: image clean
	-docker stop deb
	-docker rm deb
	docker run -itd --name deb --mount type=bind,source=$(shell pwd),target=/work nk/debian-image
	docker exec -it deb make build

build:
	build-simple-cdd --conf nk.conf --force-root --force-preseed
	cp images/debian-10-amd64-CD-1.iso nitrokey-debian-oem.iso
	@echo "image: ./nitrokey-debian-oem.iso"

image:
	docker build -t nk/debian-image .
	touch $@

clean:
	rm -rf tmp images image


