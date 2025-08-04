#!/bin/bash

# Fly.io Deployment Script

set -e  # Script stops on first error

APP_NAME="SnookerScoresBackend"  # Ersetze dies durch den Namen deiner App
IMAGE_NAME="${APP_NAME}:latest"

echo "### Fly.io Deployment Script gestartet ###"

# 1. Fly.io App erstellen (falls nicht vorhanden)
if ! flyctl apps list | grep -q "$APP_NAME"; then
  echo "Fly.io App '$APP_NAME' wird erstellt..."
  flyctl apps create "$APP_NAME"
else
  echo "Fly.io App '$APP_NAME' existiert bereits."
fi

# 2. Docker-Image bauen
echo "Docker-Image wird gebaut..."
docker build -t "$IMAGE_NAME" .

# 3. Docker-Image zu Fly.io hochladen und deployen
echo "Docker-Image wird zu Fly.io hochgeladen..."
flyctl deploy --image "$IMAGE_NAME"

# 4. Fly.io App starten
echo "Fly.io App wird gestartet..."
flyctl scale count 1  # Stelle sicher, dass mindestens 1 Instanz läuft

echo "### Fly.io Deployment abgeschlossen ###"
