# Etap 1: Budowanie i publikowanie aplikacji
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app
COPY . .
RUN dotnet restore src/BusinessServices/ParagonServices/ParagonService/ParagonService.csproj
RUN dotnet publish src/BusinessServices/ParagonServices/ParagonService/ParagonService.csproj -c Release -o /app/publish

# Etap 2: Runtime (uruchamianie aplikacji)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final

WORKDIR /app
COPY --from=build /app/publish .

ENV ASPNETCORE_URLS=http://+:7003
EXPOSE 7003
ENTRYPOINT ["dotnet", "ParagonService.dll"]