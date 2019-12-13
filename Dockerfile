### Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS dotnet-build-env
COPY ./TodoApi /src
WORKDIR /src
RUN dotnet publish -c Release

### Publish Stage
FROM mcr.microsoft.com/dotnet/core/aspnet:3.0
WORKDIR /app
COPY --from=dotnet-build-env /src/bin/Release/netcoreapp3.0/publish .
ENV project_dll="TodoApi.dll"
ENTRYPOINT ["dotnet", "TodoApi.dll"]