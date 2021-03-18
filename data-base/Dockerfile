FROM ubuntu:20.04

LABEL maintainer="Vince Forgione <vince.4gione@icloud.com" \
  license="mit" \
  repo.github="https://github.com/vforgione/dockerfiles" \
  repo.gitlab="https://gitlab.com/vforgione/dockerfiles"

ARG DEBIAN_FRONTEND=noninteractive

ENV MINICONDA_HOME=/usr/lib/miniconda \
  LANG=en_US.UTF-8 \
  LC_ALL=en_US.UTF-8 \
  SCALA_HOME=/usr/lib/scala

RUN apt-get update && \
  apt-get install -y wget gnupg2 openjdk-8-jdk locales language-pack-en && \
  echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0x2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
  apt-get update && \
  apt-get install -y sbt && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get autoclean && \
  apt-get clean

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

COPY root/conda-packages.txt .

ARG TMP_INSTALL_MINICONDA=/tmp/install-miniconda.sh

RUN wget -O ${TMP_INSTALL_MINICONDA} https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
  bash ${TMP_INSTALL_MINICONDA} -b -p ${MINICONDA_HOME} && \
  rm -v ${TMP_INSTALL_MINICONDA} && \
  ${MINICONDA_HOME}/bin/conda config --set always_yes yes --set changeps1 no && \
  ${MINICONDA_HOME}/bin/conda info -a && \
  ${MINICONDA_HOME}/bin/conda install -y mamba -n base -c conda-forge && \
  ${MINICONDA_HOME}/bin/mamba install -y --file=conda-packages.txt -c conda-forge --prune && \
  find ${MINICONDA_HOME} -follow -type f -name '*.a' -delete && \
  find ${MINICONDA_HOME} -follow -type f -name '*.js.map' -delete && \
  ${MINICONDA_HOME}/bin/mamba clean -ay

ENV PATH=$MINICONDA_HOME/bin:$PATH

ARG TMP_SCALA_TGZ=/tmp/scala.tgz

RUN wget -O ${TMP_SCALA_TGZ} https://downloads.lightbend.com/scala/2.12.10/scala-2.12.10.tgz && \
  mkdir -p ${SCALA_HOME} && \
  tar -xzvf ${TMP_SCALA_TGZ} --strip-components=1 -C ${SCALA_HOME} && \
  rm -v ${TMP_SCALA_TGZ}

ENV PATH=$SCALA_HOME/bin:$PATH
