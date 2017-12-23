# dotnetcore-docker-unittesting
Quick example of working xunit into a dockerized asp.net core app. 

Well, if I get it working. This is kinda a coding exercise for me to figure out how to combine the "standard" dotnet core + docker workflow and layer in unit testing in a non-traumatic way.

### Initial Setup (initial commit -> tag: dockerization)

In this repo, I used `dotnet new webapi` and `dotnet new test` in the /api and /tests folder, respectively.

I made a small service `MyCoolService` and injected it into the `values` webapi controller.

You can check with curl/postman that the /api/values GET should return "value1, value2, cool string brah"

I added a reference to the api project from the test project, keeping the paths straight can be a challenge vs. traditional Visual Studio folder/project conventions.

I wrote a unit test that confirms what the service should return.

Note: I didn't have to mock out anything external for my service since it's fakey/madeup. This'll be different in real life for you.

### Dockerization

I started with the Microsoft two-step build and deploy/service Docker example that's commonly found around dotnet core 2 + Docker.

I think that having the test projects underfoot, and built into the app structure breaks with convention a little too hard, so I worked on laying in the tests into an appropiate place in the SDK image. 

It's important to run the tests in the SDK image, since it feels like copying things into the "server" image is implicitly saying a change/build is good enough to be served up, and the SDK has way more dotnet goodness (like dotnet test) anwyays.

