FROM vforgione/ds-base

LABEL maintainer="Vince Forgione <vince.4gione@icloud.com" \
  license="mit" \
  repo.github="https://github.com/vforgione/dockerfiles" \
  repo.gitlab="https://gitlab.com/vforgione/dockerfiles"

ARG SPARK_VERSION="3.0.1"
ARG HADOOP_VERSION="2.7"

ENV MINICONDA_HOME=/usr/lib/miniconda \
  PATH=$MINICONDA_HOME/bin:$PATH \
  LANG=en_US.UTF-8 \
  LC_ALL=en_US.UTF-8 \
  SCALA_HOME=/usr/lib/scala \
  PATH=$SCALA_HOME/bin:$PATH \
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
  SPARK_HOME="/usr/lib/spark"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt-get install -y openssh-client openssh-server && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get autoclean && \
  apt-get clean

RUN wget -O /tmp/spark.tgz https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && \
  mkdir -p ${SPARK_HOME} && \
  tar -vxzf /tmp/spark.tgz --strip-components=1 -C ${SPARK_HOME} && \
  rm -v /tmp/spark.tgz

ENV PYSPARK_PYTHON=python \
  PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH

COPY usr/lib/spark/conf/log4j.properties ${SPARK_HOME}/conf/
COPY usr/lib/spark/conf/log4j_docker.properties ${SPARK_HOME}/conf/

RUN  mkdir .ssh && \
  ssh-keygen -q -t rsa -N '' -f .ssh/id_rsa && \
  cp .ssh/id_rsa.pub .ssh/authorized_keys

COPY etc/docker-entrypoint.sh /etc/
RUN chmod 775 /etc/docker-entrypoint.sh

EXPOSE 4040 7077 8080 8081 8888

WORKDIR ${SPARK_HOME}
ENTRYPOINT [ "/etc/docker-entrypoint.sh" ]
