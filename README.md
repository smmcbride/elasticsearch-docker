# elasticsearch-docker
For building an old version of Elasticsearch on my M1 laptop

## To run:
This project uses docker to build and launch an old version of Elasticsearch. 

Run it locally by cloning and running the project with:
```
git clone git@github.com:smmcbride/elasticsearch-docker.git
cd elasticsearch-docker 
make up
```


Including in a docker-compose file:
```dockerfile
  elasticsearch:
    platform: linux/amd64
    image: smmcbride/elasticsearch:5.6.14
    environment:
      - discovery.type=single-node
      - bootstrap.memory_lock=true
      - xpack.security.enabled=false
      - "ES_JAVA_OPTS=-Xms512m -Xmx512m"
    ulimits:
      memlock:
        soft: -1
        hard: -1
    ports:
      - 9200:9200

```
---
### Helpful Commands 
_Notes from debugging_

Build the image locally and start it image with bash, useful for debugging:
```
docker build -t es_image .
docker rm es;docker run -it --name es es_image /bin/bash
```

Build and run the image locally
```
docker build -t es_image .
 docker rm es;docker run -p 9200:9200 --name es es_image
 ```

---
### Helpful stackoverflow link(s):

* [Interactive command in Dockerfile](https://stackoverflow.com/questions/40854482/interactive-command-in-dockerfile)
* [Apple M1 Chip, No Matching Manifest For Linux/Arm64/V8 Docker MySql](https://onexlab-io.medium.com/apple-m1-chip-no-matching-manifest-for-linux-arm64-v8-docker-mysql-5142060a9309)