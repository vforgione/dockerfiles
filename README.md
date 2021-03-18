# Vince's Dockerfiles

This repository contains the Dockerfiles I maintain for building my development environments. These should be treated as beta-quality at best; i.e. **do not use these for production environments**.

## Listing

For detailed information about the images listed here, read the README files within each directory.

### data-base

This is the base image for  data engineering and data science related images. This isn't a _database_.

### spark-standalone

The name says it all: this is a standalone Apache Spark image. This image is built on top of the `data-base` image.

### zeppelin

Another where the name is the give-away: this is an Apache Zeppelin image.  This image is built on top of the `data-base` image, and it copies in the `$SPARK_HOME` directory of the `spark-standlone` image to provide the necessary libraries to function.

## Makefile

The `Makefile` included in this repository has targets for building the images and running their output containers. It's just me being lazy and not wanting to type out a bunch of port mappings, basically.
