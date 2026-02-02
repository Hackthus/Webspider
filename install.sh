#!/usr/bin/env bash

set -e

# Vérifier Python 3
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[-]${NC} Python3 n'est pas installé"
    exit 1
fi

# Vérifier pip (compatible pyenv)
if ! python3 -m pip --version &> /dev/null; then
    echo -e "${YELLOW}[*]${NC} Installation de pip..."
    python3 -m ensurepip --upgrade
fi

# Installation des dépendances
echo -e "${BLUE}[*]${NC} Installation des dépendances..."
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt

# Rendre le script exécutable
echo -e "${BLUE}[*]${NC} Configuration de WebSpider..."
chmod +x webspider

# Optionnel : installation dans /usr/local/bin
if [ ! -f "/usr/local/bin/webspider" ]; then
    sudo ln -s "$(pwd)/webspider" /usr/local/bin/webspider
fi

# Vérification
if command -v webspider &> /dev/null; then
    echo -e "${GREEN}[+]${NC} WebSpider installé avec succès !"
    echo -e "${GREEN}[+]${NC} Testez avec : webspider -h"
else
    echo -e "${RED}[-]${NC} Erreur lors de l'installation"
    exit 1
fi
