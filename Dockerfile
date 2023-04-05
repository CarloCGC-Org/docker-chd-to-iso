FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y mame-tools

WORKDIR /tmp/images

ENTRYPOINT for i in "$(pwd)"/*.chd ; do \
     filename="$(basename "$i" | sed 's/\(.*\)\..*/\1/')"; \
     dir="$(pwd)/_ISO"; \
     [ -e "$i" ] || continue; \
     [ -e "${dir}/${filename}.iso" ] && continue; \
     mkdir -p "$dir"; \
     chdman extractcd -f -i "$i" -o "${dir}/${filename}.cue" -ob "${dir}/${filename}.iso"; \
     del "${dir}/${filename}.cue"; \
done