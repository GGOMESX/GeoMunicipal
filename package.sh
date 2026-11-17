#!/usr/bin/env bash
# Gera geomunicipal-<versão>.zip pronto para enviar ao plugins.qgis.org
set -euo pipefail
cd "$(dirname "$0")"
VERSION=$(grep '^version=' geomunicipal/metadata.txt | cut -d= -f2)
OUT="geomunicipal-${VERSION}.zip"
rm -f "$OUT"
find geomunicipal -name '__pycache__' -type d -prune -exec rm -rf {} +
zip -r "$OUT" geomunicipal -x '*.pyc' '*/.git/*' '*/.DS_Store'
echo "Gerado: $OUT"
