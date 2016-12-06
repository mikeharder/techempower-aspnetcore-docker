# Build
## Common
```
netsh advfirewall firewall add rule name="TCP 8080" dir=in action=allow protocol=TCP localport=8080
git clone https://github.com/TechEmpower/FrameworkBenchmarks
cd FrameworkBenchmarks\frameworks\CSharp\aspnetcore\Benchmarks
copy appsettings.postgresql.json appsettings.json
notepad appsettings.json (replace {db_server_placeholder} with db-name-or-ip)
```
## Host
```
cd FrameworkBenchmarks\frameworks\CSharp\aspnetcore\Benchmarks
copy project.json project.json.net451
findstr /v net451 project.json.net451 > project.json
dotnet restore
dotnet publish -c Release
```
## Container
```
cd FrameworkBenchmarks\frameworks\CSharp\aspnetcore\Benchmarks
git submodule add https://github.com/mikeharder/techempower-aspnetcore-docker
docker build -t techempower-aspnetcore-docker -f techempower-aspnetcore-docker\1.0\nanoserver\Dockerfile .
```

# Fortunes
## Server
### Host
```
dotnet bin\Release\netcoreapp1.0\Benchmarks.dll scenarios=fortunes server.urls=http://+:8080 noninteractive=true
```
