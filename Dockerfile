FROM podbox/debian

ENV KIBANA_VERSION 4.5.0
RUN (curl https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz | gunzip -c | tar x) \
 && mv kibana-$KIBANA_VERSION-linux-x64 /kibana

RUN sed -i 's/# elasticsearch.url: "http:\/\/localhost:9200"/elasticsearch.url: "http:\/\/elasticsearch:9200"/' /kibana/config/kibana.yml

RUN useradd -m kibana \
 && chown -R kibana:kibana /kibana

USER kibana
EXPOSE 5601
CMD ["/kibana/bin/kibana"]
