all: 
	docker run -it --mount type=bind,source=$(shell pwd),target=/work debian:buster

build:

