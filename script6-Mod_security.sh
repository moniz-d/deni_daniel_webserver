#!/bin/bash

sudo dnf install -y mod_security mod_security_crs

sudo systemctl restart httpd

echo "=== Simulação e Teste de Ataques (SQLi e XSS) ==="
echo "-> A testar ataque simulado de XSS..."
curl -s "http://localhost/?q=<script>alert('xss')</script>" | head -n 5

echo "-> A testar ataque simulado de SQL Injection..."
curl -s "http://localhost/?id=1%27%20OR%201=1" | head -n 5

echo "=============================================================================="
echo "Script 6 executado com sucesso! ModSecurity e OWASP CRS instalados."
echo "=============================================================================="
