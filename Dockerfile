# Stage 1 - Build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy entire source code including all project references
COPY . .

# Restore and publish the Web API project
RUN dotnet restore src/api/server/Server.csproj
#RUN dotnet publish src/api/server/Server.csproj -c Release -o /app/publish
RUN dotnet publish src/api/server/Server.csproj -c Release -o /app/publish /p:PublishProfile=""

# Stage 2 - Runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:80
EXPOSE 80

ENTRYPOINT ["dotnet", "FSH.Starter.WebApi.Host.dll"]

