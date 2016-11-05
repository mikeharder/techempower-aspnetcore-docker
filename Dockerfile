FROM microsoft/dotnet

ENV SCENARIOS plaintext
ENV THREADCOUNT 1

ARG DBHOST

WORKDIR /app

ENV ASPNETCORE_URLS http://+:8080
EXPOSE 8080

COPY . .

COPY appsettings.postgresql.json appsettings.json
RUN sed -i 's|{db_server_placeholder}|'"${DBHOST}"'|g' appsettings.json

RUN sed -i '/"net451": { }/d' project.json

RUN dotnet restore
RUN dotnet build -c Release
ENTRYPOINT dotnet run -c Release server.urls=http://*:8080 scenarios=$SCENARIOS server=kestrel threadcount=$THREADCOUNT noninteractive=true
