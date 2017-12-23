FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

#the layer with the restoring the csprojs themselves saves a lot of time :shrug:

# Copy everything and build
COPY . ./
RUN dotnet restore ./tests/tests.csproj
RUN dotnet restore ./api/api.csproj

RUN dotnet publish ./api/api.csproj -c Release -o ./out
RUN ls -la

# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=build-env ./api/out ./
ENTRYPOINT ["dotnet", "api.dll"]