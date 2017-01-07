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
dotnet build -c Release
```
## Container
```
cd FrameworkBenchmarks/frameworks/CSharp/aspnetcore/Benchmarks
git submodule add https://github.com/mikeharder/techempower-aspnetcore-docker
docker build -t aspnetcore -f techempower-aspnetcore-docker/1.0/debian/Dockerfile .
```

# Plaintext
## Server
### Host
```
dotnet bin/Release/netcoreapp1.1/Benchmarks.dll scenarios=plaintext server.urls=http://+:8080 threadcount=[nproc / 4] noninteractive=true
```
### Container
```
docker run -it --rm -p 8080:8080 -e SCENARIOS=plaintext -e THREADCOUNT=[nproc / 4] aspnetcore
```
## Client
```
wget https://raw.githubusercontent.com/mikeharder/pipeline-lua/master/pipeline.lua
wrk -c 256 -t 32 -d 10 -s pipeline.lua http://server-ip-or-name:8080/plaintext -- 16
```

# Fortunes
## Server
### Host
```
dotnet bin/Release/netcoreapp1.1/Benchmarks.dll scenarios=fortunes server.urls=http://+:8080 noninteractive=true
```
### Container
#### Bridge Networking
```
docker run -it --rm -p 8080:8080 -e SCENARIOS=fortunes -e DBHOST=db-name-or-ip aspnetcore
```
#### Host Networking
```
docker run -it --rm --network host -e SCENARIOS=fortunes -e DBHOST=db-name-or-ip aspnetcore
```
## Client
```
wrk -c 256 -t 32 -d 10 http://server-ip-or-name:8080/fortunes/raw
```
