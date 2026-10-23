#!/bin/bash
# ==============================================================================
# Script Mestre: Execução Automatizada de Todos os Scripts (1 ao 11)
# ==============================================================================

echo "=== INÍCIO DA AUTOMAÇÃO DO SERVIDOR LAMP ==="

# Lista com os nomes exatos dos scripts no teu repositório
scripts=(
    "script1_instalacao.sh"
    "script2_mariadb.sh"
    "script3_config_rede.sh"
    "script4_SElinux.sh"
    "script5_Fail2ban.sh"
    "script6-Mod_security.sh"
    "script7_TuningApache.sh"
    "script8_TuningMariaDB.sh"
    "script9_ajustesPHP.sh"
    "script10_backup.sh"
    "script11_moni.sh"
)

# Loop para correr cada script um a um pela ordem correta
for s in "${scripts[@]}"; do
    if [ -f "$s" ]; then
        echo "--------------------------------------------------"
        echo "A executar o $s..."
        echo "--------------------------------------------------"
        bash "$s"
        
        # Verifica se o script correu com sucesso
        if [ $? -ne 0 ]; then
            echo "ATENÇÃO: Ocorreu um erro no $s. A parar a execução."
            exit 1
        fi
    else
        echo "Erro: O ficheiro $s não foi encontrado nesta pasta!"
        exit 1
    fi
done

echo "=============================================================================="
echo "TODOS OS 11 SCRIPTS FORAM EXECUTADOS COM SUCESSO!"
echo "=============================================================================="
