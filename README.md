# Build
## Common
```
git clone https://github.com/TechEmpower/FrameworkBenchmarks
```
## Host
```
cd FrameworkBenchmarks/frameworks/CSharp/aspnetcore/Benchmarks
sed -i.net451 '/net451/d' project.json
sed 's|{db_server_placeholder}|db-name-or-ip|g' appsettings.postgresql.json > appsettings.json
dotnet restore
dotnet publish -c Release
```
## Container
```
cd FrameworkBenchmarks/frameworks/CSharp/aspnetcore/Benchmarks
git submodule add https://github.com/mikeharder/techempower-aspnetcore-docker
docker build -t aspnetcore -f techempower-aspnetcore-docker/Dockerfile .
```

## Plaintext
```
docker run -it --rm -p 8080:8080 -e SCENARIOS=plaintext -e THREADCOUNT=[nproc / 4] aspnetcore

wget https://raw.githubusercontent.com/mikeharder/pipeline-lua/master/pipeline.lua
wrk -c 256 -t 32 -d 10 -s pipeline.lua http://server-ip-or-name:8080/plaintext -- 16
```

## Fortunes
```
docker run -it --rm -p 8080:8080 -e SCENARIOS=fortunes -e DBHOST=db-name-or-ip aspnetcore
```
