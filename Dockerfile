FROM dockage/alpine-runit
MAINTAINER Mehrzad Rajabzadeh (m3hr24d)

RUN apk add --no-cache --virtual=build-dependencies \
	g++ gcc git make texinfo && \
	apk add --no-cache inotify-tools && \
    git clone https://github.com/jech/polipo /tmp/polipo-source && \
	cd /tmp/polipo-source && make install && \
	apk del --purge build-dependencies && \
	rm -rfv /tmp/*
COPY assets/ /

EXPOSE 8123