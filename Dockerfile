# Stage 1 - Build

# Use the .NET 9 SDK to build the app
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# Set the working folder in the container
WORKDIR /src

# Copy all files from the host to the container
COPY . .

# Restore dependencies for the project
RUN dotnet restore src/api/server/Server.csproj

# Build and publish the app to a folder
RUN dotnet publish src/api/server/Server.csproj -c Release -o /app/publish /p:PublishProfile=""


# Stage 2 - Runtime

# Use a smaller image with only the .NET runtime to run the app
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

# Set the working folder
WORKDIR /app

# Copy the published app from the build stage
COPY --from=build /app/publish .

# Tell ASP.NET Core to listen on port 80
ENV ASPNETCORE_URLS=http://+:80

# Expose port 80 to the outside
EXPOSE 80

# Run the app
ENTRYPOINT ["dotnet", "FSH.Starter.WebApi.Host.dll"]
