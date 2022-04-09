FROM ubuntu

RUN apt-get update -y && apt-get upgrade -y

RUN DEBIAN_FRONTEND="noninteractive" apt-get install curl vim apt-transport-https wget -y

RUN useradd -ms /bin/bash grafana
USER grafana
WORKDIR /home/grafana

ENV VERSION=8.0.6

RUN wget https://dl.grafana.com/oss/release/grafana-$VERSION.linux-amd64.tar.gz
RUN tar -xzf grafana-$VERSION.linux-amd64.tar.gz
RUN rm grafana-$VERSION.linux-amd64.tar.gz

EXPOSE 3000

WORKDIR /home/grafana/grafana-$VERSION/bin
RUN chmod +x grafana-server

CMD ["./grafana-server", "web"]
