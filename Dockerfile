FROM ubuntu:18.04
LABEL maintainer="Shawn McBride"
LABEL description="For building an old version of Elasticsearch on my M1 laptop."
LABEL version="1.0"

RUN apt-get update --yes
RUN apt-get install openjdk-8-jdk --yes --force-yes
RUN apt-get install curl wget build-essential gcc make unzip --yes
RUN echo java -version

ARG ES_USER=elasticsearch_user
ARG ES_VERSION=5.6.14

RUN useradd -ms /bin/bash ${ES_USER}
USER ${ES_USER}
WORKDIR /home/${ES_USER}

RUN curl -L -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-${ES_VERSION}.tar.gz 
RUN tar -xvf elasticsearch-${ES_VERSION}.tar.gz
COPY elasticsearch.yml elasticsearch-${ES_VERSION}/config/elasticsearch.yml
ENV PATH="elasticsearch-${ES_VERSION}/bin:${PATH}"

EXPOSE 9200

CMD ["elasticsearch"]