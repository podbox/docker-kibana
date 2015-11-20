FROM podbox/debian

ENV KIBANA_VERSION 4.2.1
RUN (curl https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz | gunzip -c | tar x) \
 && mv kibana-$KIBANA_VERSION-linux-x64 /kibana

RUN sed -i 's/http:\/\/localhost:9200/http:\/\/elasticsearch:9200/' /kibana/config/kibana.yml

EXPOSE 5601
CMD ["/kibana/bin/kibana"]
