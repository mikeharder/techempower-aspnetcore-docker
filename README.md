# techempower-aspnetcore-docker

## Server
```
git clone https://github.com/TechEmpower/FrameworkBenchmarks
cd FrameworkBenchmarks/frameworks/CSharp/aspnetcore/Benchmarks
git submodule add https://github.com/mikeharder/techempower-aspnetcore-docker
docker build -t aspnetcore -f techempower-aspnetcore-docker/Dockerfile .

Plaintext: docker run -it --rm -p 8080:8080 -e SCENARIOS=plaintext -e THREADCOUNT=[nproc / 4] aspnetcore
DbFortunesRaw: docker run -it --rm -p 8080:8080 -e SCENARIOS=dbfortunesraw -e DBHOST=db-name-or-ip aspnetcore
```
