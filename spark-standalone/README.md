# Vince's Spark Standalone

This is an Apache Spark standalone image. It's built on top of `vforgione/data-base`.

**Spark Version:** 3.0.1  
**Haddop Version:** 2.7

## What's Included?

- Everything from the base image
- `apt` Installations:
  - openssh-client
  - openssh-server
- Other Installations:
  - spark
- Envrionment Variables:
  - SPARK_HOME=/usr/lib/spark
  - PYSPARK_PYTHON=python
  - PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

## Ports

I recommend mapping the following ports:

- 4040
- 7077
- 8080
- 8081
- 8888

## Entrypoint

The entrypoint script for this image does the following:

1. Starts the OpenSSH Server
1. Starts a Spark Master and Spark Worker (via the `start-all.sh` spark script)
1. Executes `sleep infinity` to keep the container running

## Default Command

There is not default command for this image.
