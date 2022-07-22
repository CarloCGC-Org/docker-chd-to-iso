FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y mame-tools

WORKDIR /tmp/images

ENTRYPOINT for i in "$(pwd)"/*.cue "$(pwd)"/*.iso "$(pwd)"/*.gdi "$(pwd)"/**/*.cue "$(pwd)"/**/*.iso "$(pwd)"/**/*.gdi ; do \
     filename="$(basename "$i" | sed 's/\(.*\)\..*/\1/')"; \
     dir="$(pwd)/_CHD/"; \
     [ -e "$i" ] || continue; \
     [ -e "${dir}/${filename}.chd" ] && continue; \
     mkdir -p "$dir"; \
     chdman createcd -f -i "$i" -o "${dir}/${filename}.chd"; \
done