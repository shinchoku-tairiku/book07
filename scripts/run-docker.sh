#!/bin/bash

IMAGE=amutake/satysfi:nightly

docker run --rm -it -v "$(pwd):/satysfi" "${IMAGE}" satysfi $@
