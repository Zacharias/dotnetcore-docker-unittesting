# dotnetcore-docker-unittesting
Quick example of working xunit into a dockerized asp.net core app

### Initial Setup (initial commit -> tag: dockerization)

In this repo, I used `dotnet new webapi` and `dotnet new test` in the /api and /tests folder, respectively.

I made a small service `MyCoolService` and injected it into the `values` webapi controller.

You can check with curl/postman that the /api/values GET should return "value1, value2, cool string brah"

I added a reference to the api project from the test project, and wrote a unit test that confirms what the service should return.

Note: I didn't have to mock out anything external for my service since it's fakey/madeup. This'll be different in real life for you.

### Dockerization

(staring that now)
