# Etap 1: Budowanie i publikowanie aplikacji
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app
COPY . .
RUN dotnet restore src/BusinessServices/PZServices/PZService/PZService.csproj
RUN dotnet publish src/BusinessServices/PZServices/PZService/PZService.csproj -c Release -o /app/publish

# Etap 2: Runtime (uruchamianie aplikacji)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final

WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:7004
EXPOSE 7004
ENTRYPOINT ["dotnet", "PZService.dll"]