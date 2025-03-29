# Etap 1: Budowanie i publikowanie aplikacji
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app
COPY . .
RUN dotnet restore src/UserInterfaceServices/UserInterfaceService/UserInterfaceService.csproj
RUN dotnet publish /UserInterfaceServices/UserInterfaceService/UserInterfaceService.csproj -c Release -o /app/publish

# Etap 2: Runtime (uruchamianie aplikacji)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final

WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:7000
EXPOSE 7000
ENTRYPOINT ["dotnet", "UserInterface.dll"]