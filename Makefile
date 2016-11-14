# set default shell
SHELL := $(shell which bash)
ENV = /usr/bin/env

# default shell options
.SHELLFLAGS = -c

.SILENT: ;               # no need for @
.ONESHELL: ;             # recipes execute in same shell
.NOTPARALLEL: ;          # wait for this target to finish
.EXPORT_ALL_VARIABLES: ; # send all vars to shell
default: all;   # default target

.PHONY: all config build

all: build

config:
	cp -n -v config.yml.dist config.yml

build: config
	$(ENV) python packer docker
