#!/bin/bash

# Script d'installation automatique pour Linux

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}[*]${NC} Installation de WebSpider..."

# Vérifier Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}[-]${NC} Python 3 n'est pas installé !"
    exit 1
fi

# Vérifier pip
if ! command -v pip3 &> /dev/null; then
    echo -e "${YELLOW}[*]${NC} Installation de pip..."
    sudo apt-get update
    sudo apt-get install -y python3-pip
fi

# Cloner le repo
if [ -d "Webspider" ]; then
    echo -e "${BLUE}[*]${NC} Mise à jour du repository..."
    cd Webspider
    git pull
else
    echo -e "${BLUE}[*]${NC} Clonage du repository..."
    git clone https://github.com/Hackthus/Webspider.git
    cd Webspider
fi

# Installation des dépendances
echo -e "${BLUE}[*]${NC} Installation des dépendances..."
pip3 install -r requirements.txt

# Installation globale
echo -e "${BLUE}[*]${NC} Installation de WebSpider..."
sudo pip3 install .

# Vérification
if command -v webspider &> /dev/null; then
    echo -e "${GREEN}[+]${NC} WebSpider installé avec succès !"
    echo -e "${GREEN}[+]${NC} Testez avec : webspider -h"
else
    echo -e "${RED}[-]${NC} Erreur lors de l'installation"
    exit 1
fi



