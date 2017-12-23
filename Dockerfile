FROM microsoft/aspnetcore-build:2.0 AS build-env
WORKDIR /app

#this caching proj files that was here in the first place was causing confusion 
# amongst us non-galaxy meme brain
COPY . ./
# since the test project relies on the api project, we get the api restore "free" here.
RUN dotnet restore ./tests/tests.csproj
#this step will result in a build failure if the tests do not pass
RUN dotnet test ./tests/tests.csproj --no-restore > ./tests/results.txt

RUN dotnet publish ./api/api.csproj -c Release -o ../out
#now that there's an output directory, we ought to copy the test results out there.
RUN cp ./tests/results.txt ./out

# Build runtime image
FROM microsoft/aspnetcore:2.0
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "api.dll"]