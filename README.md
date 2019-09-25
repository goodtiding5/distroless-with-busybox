# Distroless Docker Images With Busybox #

*Google* released a series of "Distroless" images to restrict what's
inside the container.  These "barebone" containers have been widele
used by Google and other tech giants in production.

However, developers would much desire to have a shell access during
the development and validation stages, with minimal intrusion.  This
is the effort to introduce a statically linked busybox to the
"Distroless" base image.

## Preparation ##

According to *Google*, "Distroless" images contain no package managers,
shells or many other programs present in a standard linux distrubution.
Normal `RUN` instruction in `Dockerfile` will not work as it requires
a shell to execute.  Therefore, all the work must be done in priori.

I use the following procedures to prepare `/bin` directory where `busybox`
commands will be:

```
$ mkdir bin
$ cd bin
$ curl -O https://busybox.net/downloads/binaries/1.30.0-i686/busybox
$ chmod 0555 busybox
$ for f in $(./busybox --list); do ln -f busybox $f; done

```

## Have Fun! ##

Now you can use your normal *Docker* magic to create your 
[distroless-with-busybox](https://github.com/goodtiding5/distroless-with-busybox)
image.

A ready made image can be pulled from Docker hub.
