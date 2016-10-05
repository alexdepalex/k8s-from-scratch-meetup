```
docker run -ti -d \
  -p 8989:80 \
  -v $(pwd):/usr/share/nginx/html:ro \
  nginx

open http://localhost:8989
```
