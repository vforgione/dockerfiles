# Vince's Data Base

This is the base image that other data engineering and data science images are built on top of. This is **not** a _database_.

## What's Included?

- Ubuntu 20.04
- `apt` Installations:
  - wget
  - gnupg2
  - openjdk-8-jdk
  - locales
  - language-pack-en
  - sbt
- Other Installations:
  - miniconda
  - mamba
  - python
  - R
  - scala
- Envrionment Variables:
  - LANG=en_US.UTF-8
  - LC_ALL=en_US.UTF-8
  - MINICONDA_HOME=/usr/lib/miniconda
  - JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
  - SCALA_HOME=/usr/lib/scala
  - PATH=$SCALA_HOME/bin:$MINICONDA_HOME/bin:$PATH
    - `which python` == $MINICONDA_HOME/bin/python
    - `which R` == $MINICONDA_HOME/bin/R
    - `which mamba` == $MINICONDA_HOME/bin/mamba

## Entrypoint and Default Command

There are neither an entrypoint nor a default command for this image.
