#!/bin/sh

sed -i 's|{db_server_placeholder}|'"${DBHOST}"'|g' appsettings.json
dotnet app.dll scenarios=$SCENARIOS server=kestrel threadcount=$THREADCOUNT noninteractive=true
