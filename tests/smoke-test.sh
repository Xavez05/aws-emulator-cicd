#!/usr/bin/env bash
set -euo pipefail

echo "Escribiendo un item en la tabla..."
aws dynamodb put-item \
  --table-name prueba \
  --item '{"id":{"S":"1"},"nombre":{"S":"test"}}'

echo "Leyendo el item..."
RESULT=$(aws dynamodb get-item \
  --table-name prueba \
  --key '{"id":{"S":"1"}}')

echo "$RESULT" | grep -q '"test"'
echo "OK: la tabla guarda y devuelve datos"
