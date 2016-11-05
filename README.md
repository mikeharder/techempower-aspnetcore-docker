# techempower-aspnetcore-docker

## Server
```
docker build -t aspnetcore .
docker run -it --rm -p 8080:8080 -e THREADCOUNT=3 -e DBHOST=db-name-or-ip aspnetcore
```
