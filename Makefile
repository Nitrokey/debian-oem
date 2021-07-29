myperms=$(shell id -u).$(shell id -g)
iso_name=`cat ./ISO_NAME`

all: clean clean
	-docker stop deb
	-docker rm deb
	docker run -itd --name deb --mount type=bind,source=$(shell pwd),target=/work nk/debian-image
	docker exec -it deb make build

ci: image 
	docker run -itd --name deb --mount type=bind,source=$(shell pwd),target=/work nk/debian-image
	docker exec -i deb make build

build:
	build-simple-cdd --conf nk.conf --force-root --force-preseed
	cp images/debian-10-amd64-CD-1.iso $(iso_name)
	@echo "image: $(iso_name)"

image:
	docker build -t nk/debian-image .
	touch $@

clean:
	sudo chown -R $(myperms) .
	rm -rf tmp images image


