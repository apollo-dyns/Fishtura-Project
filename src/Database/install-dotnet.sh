#!/bin/sh

# Sprawdzenie systemu operacyjnego
OS=$(cat /etc/os-release | grep "^ID=" | cut -d'=' -f2)

echo "Wykryto system: $OS"

# Instalacja brakujących narzędzi
case "$OS" in
    alpine)
        echo "Instalowanie narzędzi w Alpine Linux..."
        apk add --no-cache bash curl wget
        ;;
    debian|ubuntu)
        echo "Instalowanie narzędzi w Debian/Ubuntu..."
        apt update && apt install -y bash curl wget
        ;;
    *)
        echo "Nieznany system operacyjny. Przerwano instalację."
        exit 1
        ;;
esac

# Pobranie skryptu instalacyjnego .NET
echo "Pobieranie skryptu instalacyjnego .NET..."
wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh || curl -O https://dot.net/v1/dotnet-install.sh

# Nadanie uprawnień do uruchomienia
chmod +x dotnet-install.sh

# Uruchomienie instalacji .NET
echo "Instalowanie .NET..."
bash dotnet-install.sh --install-dir /usr/share/dotnet --version latest

# Dodanie .NET do PATH
echo 'export PATH=$PATH:/usr/share/dotnet' >> ~/.profile
source ~/.profile

# Sprawdzenie instalacji
dotnet --version
