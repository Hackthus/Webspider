#!/usr/bin/env bash

set -e

REPO_DIR="Webspider"
BIN_PATH="/usr/local/bin/webspider"

echo "[*] Désinstallation de WebSpider (safe mode)..."

# Supprimer le binaire
sudo rm -f "$BIN_PATH" 2>/dev/null || true

# Supprimer le dossier du projet
rm -rf "$REPO_DIR" 2>/dev/null || true

echo "[+] WebSpider supprimé (aucune dépendance globale touchée)."
