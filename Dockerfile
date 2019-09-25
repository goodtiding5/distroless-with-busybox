FROM	gcr.io/distroless/base

COPY	./bin /bin

WORKDIR /

ENTRYPOINT	["/bin/sh", "-c"]
CMD		["sh"]
