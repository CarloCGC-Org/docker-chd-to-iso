FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y mame-tools

WORKDIR /tmp/images

ENTRYPOINT for /r %%i in (*.cue *.gdi *.iso) do \
    chdman createcd -i "%%i" -o "%%~ni.chd"; \
    done