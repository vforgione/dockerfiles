data-base-image:
	docker build -t vforgione/data-base data-base

spark-standalone-image:
	docker build -t vforgione/spark-standalone spark-standalone

spark-standalone-run:
	docker run -p 4040:4040 -p 7077:7077 -p 8080:8080 -p 8081:8081 -p 8888:8888 vforgione/spark-standalone

zeppelin-image:
	docker build -t vforgione/zeppelin zeppelin

zeppelin-run:
	docker run -p 8000:8080 vforgione/zeppelin

#
.PHONY: data-base-image docker-network spark-standalone-image spark-standalone-run zeppelin-image zeppelin-run
