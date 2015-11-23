# docker-kibana
```bash
docker run -p 5601:5601 --link elasticsearch:elasticsearch --restart always --name kibana -t podbox/kibana
```
