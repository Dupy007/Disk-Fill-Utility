#!/bin/bash

# ==========================
# Script pour remplir un disque
# ==========================

# Variables globales
TEMP_FILE="disk_fill.tmp"
BLOCK_SIZE_MB=10 # Taille par bloc en Mo
BLOCK_SIZE=$((BLOCK_SIZE_MB * 1024 * 1024)) # Taille en octets
TOTAL_WRITTEN=0

# Fonction pour afficher la barre de progression
show_progress() {
    local progress=$1
    local total=$2
    local percent=$((100 * progress / total))
    local bar=$(printf '%0.s#' $(seq 1 $((percent / 2))))
    printf "\rProgression : [%-50s] %d%%" "$bar" "$percent"
}

# Vérification de l'espace disponible
check_free_space() {
    df -m "$1" | awk 'NR==2 {print $4}' # Espace disponible en Mo
}

# Remplir le disque
fill_disk() {
    local dir="$1"
    local free_space=$(check_free_space "$dir") # Espace libre en Mo avant de commencer
    local total_space=$free_space
    echo "Espace libre détecté : $free_space Mo"
    echo "Taille des blocs : $BLOCK_SIZE_MB Mo"
    echo "Début du remplissage dans le dossier : $dir"

    local start_time=$(date +%s)

    # Écriture des fichiers temporaires jusqu'à saturation
    while (( free_space > BLOCK_SIZE_MB )); do
        dd if=/dev/urandom of="$dir/$TEMP_FILE" bs="$BLOCK_SIZE" count=1 oflag=direct status=none
        TOTAL_WRITTEN=$((TOTAL_WRITTEN + BLOCK_SIZE_MB))
        free_space=$(check_free_space "$dir")
        show_progress "$TOTAL_WRITTEN" "$total_space"
    done

    local end_time=$(date +%s)
    local elapsed_time=$((end_time - start_time))
    echo
    echo "Remplissage terminé."
    echo "Total écrit : $TOTAL_WRITTEN Mo"
    echo "Temps total : $elapsed_time secondes"

    # Suppression du fichier temporaire
    echo "Nettoyage du fichier temporaire..."
    rm -f "$dir/$TEMP_FILE"
    echo "Nettoyage terminé."
}

# Interface utilisateur
if [[ -z "$1" ]]; then
    echo "Usage : $0 <chemin_du_dossier>"
    exit 1
fi

# Vérification du répertoire sélectionné
if [[ ! -d "$1" ]]; then
    echo "Erreur : '$1' n'est pas un répertoire valide."
    exit 1
fi

fill_disk "$1"
