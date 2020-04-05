FROM openjdk:8

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y unzip

WORKDIR /runtime

RUN wget https://oss.sonatype.org/content/repositories/snapshots/fr/pilato/elasticsearch/crawler/fscrawler-es7/2.7-SNAPSHOT/fscrawler-es7-2.7-20200403.145039-96.zip
RUN unzip fscrawler-es7-2.7-20200403.145039-96.zip

WORKDIR /runtime/fscrawler-es7-2.7-SNAPSHOT

RUN mkdir /root/.fscrawler
RUN mkdir /root/.fscrawler/arsredovisningar
RUN mkdir /root/.fscrawler/regleringsbrev

COPY ./config/arsredovisningar/_settings.yaml /root/.fscrawler/arsredovisningar
COPY ./config/regleringsbrev/_settings.yaml /root/.fscrawler/regleringsbrev

RUN mkdir /runtime/data

ENTRYPOINT ["bin/fscrawler"]

