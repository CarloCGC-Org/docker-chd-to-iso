FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y mame-tools

WORKDIR /tmp/images

ENTRYPOINT for i in "$(pwd)"/*.cue "$(pwd)"/*.iso "$(pwd)"/*.gdi "$(pwd)"/**/*.cue "$(pwd)"/**/*.iso "$(pwd)"/**/*.gdi ; do \
     [ -e "$i" ] || continue; \
     [ -e "${i%.*}.chd" ] && continue; \
     filename="$(basename "$i")"; \
     mkdir -p "$(pwd)/CHD"; \
     chdman createcd -f -i "$i" -o "$(pwd)/CHD/${filename}.chd"; \
done