FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

COPY ./api/api.csproj ./
RUN dotnet restore ./api.csproj

# Copy everything else to the root of the builder image
COPY . ./

# having the restore in it's own step means we can usually get away with caching this layer?
RUN dotnet restore ./tests/tests.csproj

RUN dotnet xunit ./tests/tests.csproj
#RUN dotnet test ./tests/tests.csproj --no-restore > ./tests/results.txt
#RUN cat ./tests/results.txt

RUN dotnet publish ./api/api.csproj -c Release -o ../out
RUN cp ./tests/results.txt ./out

# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "api.dll"]