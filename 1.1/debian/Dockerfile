FROM microsoft/dotnet:1.1-sdk-projectjson

EXPOSE 8080

ENV SCENARIOS plaintext
ENV THREADCOUNT -1
ENV ASPNETCORE_URLS http://+:8080

WORKDIR /app

# copy project.json and restore as distinct layers
COPY project.json .
RUN dotnet restore

# copy and build everything else
COPY . .
COPY appsettings.postgresql.json appsettings.json
RUN dotnet publish -c Release -o /pub

WORKDIR /pub
COPY techempower-aspnetcore-docker/1.1/debian/run.sh .

CMD ["./run.sh"]
