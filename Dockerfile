FROM microsoft/dotnet:1.0-sdk-projectjson

ENV SCENARIOS plaintext
ENV THREADCOUNT -1

WORKDIR /app

ENV ASPNETCORE_URLS http://+:8080
EXPOSE 8080

COPY . .
COPY appsettings.postgresql.json appsettings.json

RUN sed -i.net451 '/net451/d' ./project.json

RUN dotnet restore
RUN dotnet publish -o /pub -c Release

WORKDIR /pub
COPY techempower-aspnetcore-docker/run.sh .
RUN chmod +x run.sh

CMD ["./run.sh"]
