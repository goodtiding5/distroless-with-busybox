FROM		busybox:1.30.1-musl AS busybox-build

FROM		gcr.io/distroless/base

ENV		BUSYBOX_VERSION 1.30.0
ENV		TINI_VERSION v0.18.0

ADD		https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /tini

COPY		--from=busybox-build /bin/busybox /bin/busybox
COPY		--from=busybox-build /bin/sh /bin/sh

RUN		/bin/busybox chmod 0555 /tini \
&&		(cd bin; for f in $(./busybox --list); do ./busybox ln -f -s busybox $f; done)

WORKDIR		/

ENTRYPOINT	["/tini", "--"]

CMD		["sh"]
