#!/bin/bash

# https://www.rust-lang.org/en-US/downloads.html

if [[ "$#" -ne 1 ]]; then
	echo 'the version number of the last stable you be provided'
	exit
fi

# build
docker build --no-cache --build-arg RUST_VERSION=beta -t grummfy/docker-rust:beta-latest .
docker build --build-arg RUST_VERSION=stable -t grummfy/docker-rust:stable-latest .
docker build --build-arg RUST_VERSION=nightly -t grummfy/docker-rust:nightly-latest .

# tag
docker tag grummfy/docker-rust:stable-latest grummfy/docker-rust:$1

# push
docker push grummfy/docker-rust:beta-latest
docker push grummfy/docker-rust:stable-latest
docker push grummfy/docker-rust:nightly-latest
docker push grummfy/docker-rust:$1
