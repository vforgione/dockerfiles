FROM apache/zeppelin:0.9.0 AS zeppelin-distribution
FROM vforgione/spark AS spark
FROM vforgione/ds-base

LABEL maintainer="Vince Forgione <vince.4gione@icloud.com" \
  license="mit" \
  repo.github="https://github.com/vforgione/dockerfiles" \
  repo.gitlab="https://gitlab.com/vforgione/dockerfiles"

ENV MINICONDA_HOME=/usr/lib/miniconda \
  PATH=$MINICONDA_HOME/bin:$PATH \
  LANG=en_US.UTF-8 \
  LC_ALL=en_US.UTF-8 \
  SCALA_HOME=/usr/lib/scala \
  PATH=$SCALA_HOME/bin:$PATH \
  JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64 \
  SPARK_HOME="/usr/lib/spark" \
  PYSPARK_PYTHON=python \
  PATH=$SPARK_HOME/bin:$SPARK_HOME/sbin:$PATH \
  Z_VERSION="0.9.0" \
  ZEPPELIN_HOME="/usr/lib/zeppelin" \
  HOME="/usr/lib/zeppelin" \
  ZEPPELIN_ADDR="0.0.0.0"

RUN apt-get update && \
  apt-get install -y openjdk-8-jre-headless tini && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get autoclean && \
  apt-get clean

RUN mkdir -p ${SPARK_HOME} && \
  mkdir -p ${ZEPPELIN_HOME}

COPY --from=spark ${SPARK_HOME}/ ${SPARK_HOME}/

COPY --from=zeppelin-distribution /opt/zeppelin/ ${ZEPPELIN_HOME}/

RUN chown -R root:root ${ZEPPELIN_HOME} && \
  rm -r ${ZEPPELIN_HOME}/logs ${ZEPPELIN_HOME}/run ${ZEPPELIN_HOME}/webapps && \
  mkdir -p ${ZEPPELIN_HOME}/logs ${ZEPPELIN_HOME}/run ${ZEPPELIN_HOME}/webapps && \
  # Allow process to edit /etc/passwd, to create a user entry for zeppelin
  chgrp root /etc/passwd && \
  chmod ug+rw /etc/passwd && \
  # Give access to some specific folders
  chmod -R 775 "${ZEPPELIN_HOME}/logs" "${ZEPPELIN_HOME}/run" "${ZEPPELIN_HOME}/notebook" "${ZEPPELIN_HOME}/conf" && \
  # Allow process to create new folders (e.g. webapps)
  chmod 775 ${ZEPPELIN_HOME}

COPY usr/lib/zeppelin/conf/log4j.properties ${ZEPPELIN_HOME}/conf/

COPY usr/lib/zeppelin/conf/log4j_docker.properties ${ZEPPELIN_HOME}/conf/

USER 1000

EXPOSE 8080

ENTRYPOINT [ "/usr/bin/tini", "--" ]
WORKDIR ${ZEPPELIN_HOME}
CMD [ "bin/zeppelin.sh" ]
