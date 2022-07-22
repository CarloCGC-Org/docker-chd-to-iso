docker run \
  --rm \
  -v $(pwd)/images/:/tmp/images/:rw \
  -it --platform linux/amd64 carlocgc/chd-converter \

