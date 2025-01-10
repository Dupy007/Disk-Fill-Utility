# Disk Fill Utility

## Description

**Disk Fill Utility** est une application Python avec une interface graphique (GUI) qui permet de remplir un disque ou un dossier jusqu'à saturation. Elle est conçue pour tester la capacité d'un disque ou pour évaluer ses performances d'écriture.

L'application inclut les fonctionnalités suivantes :
- Vérification de l'espace libre sur le disque.
- Estimation du temps nécessaire pour remplir le disque.
- Barre de progression pour visualiser l'état du remplissage.
- Nettoyage automatique du fichier temporaire une fois l'opération terminée.

---

## Prérequis

- Python 3.7 ou version ultérieure.
- Bibliothèques Python suivantes :
  - `tkinter` (inclus par défaut avec Python)
  - `shutil` (inclus par défaut avec Python)

---

## Installation

1. Clonez le projet ou téléchargez le fichier script :
   ```bash
   git clone https://github.com/Dupy007/Disk-Fill-Utility
   ```
2. Assurez-vous que Python 3.7+ est installé sur votre système.

3. Exécutez le script directement avec Python :
   ```bash
   cd python
   python3 disk_fill.py
   ```

---

## Utilisation

1. **Lancement de l'application :**
   - Exécutez le script `disk_fill.py`.

2. **Sélection du disque ou dossier :**
   - Cliquez sur le bouton "Sélectionner un disque ou dossier".
   - Choisissez le répertoire ou le disque cible dans la boîte de dialogue.
   - L'application affichera l'espace libre disponible dans le répertoire sélectionné.

3. **Configuration des paramètres :**
   - Spécifiez la taille des blocs d'écriture (en Mo) dans le champ correspondant. Par défaut, la taille est de 10 Mo.

4. **Démarrage de l'écriture :**
   - Cliquez sur "Démarrer le remplissage".
   - Une estimation du temps nécessaire s'affichera.
   - La barre de progression indiquera l'état d'avancement.

5. **Fin de l'opération :**
   - Une fois le disque rempli ou l'espace disponible épuisé, un message s'affichera avec le temps total et la quantité de données écrites.
   - Le fichier temporaire créé pour le remplissage sera automatiquement supprimé.

---

## Limitations

- **Performances** : La vitesse d'écriture peut varier en fonction des caractéristiques du disque et du système de fichiers.
- **Précision de l'estimation** : Le temps estimé peut ne pas être précis à 100 %.
- **Espace requis** : Assurez-vous que le répertoire sélectionné dispose d'un espace libre suffisant.

---

## Avertissements

- **Ne pas utiliser sur des disques systèmes :**
  L'écriture sur un disque système pourrait perturber le fonctionnement de l'OS.
- **Perte de données :**
  Ce script crée un fichier temporaire qui peut occuper tout l'espace libre. Assurez-vous qu'aucune opération critique ne dépend de cet espace.

---

## Contributions

Les contributions sont les bienvenues !
- Si vous trouvez un bug ou souhaitez proposer une fonctionnalité, ouvrez une issue ou une pull request sur le repo.

---

## Licence

Ce projet est distribué sous la licence MIT. Voir le fichier `LICENSE` pour plus d'informations.

---
