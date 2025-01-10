# Remplir un disque sous Linux (fill_disk.sh)

## Description

Ce script shell permet de remplir un disque en créant des fichiers temporaires de taille définie. Le processus continue jusqu'à ce que l'utilisateur l'arrête manuellement. Ce script peut être utilisé pour tester l'espace disponible sur un disque ou pour effectuer des simulations d'occupation de l'espace disque.

---

## Prérequis

- **Système d'exploitation** : Linux (distributions telles que Ubuntu, Debian, CentOS, etc.).
- **Droits d'administrateur** : Vous aurez besoin des droits nécessaires pour écrire dans le répertoire cible.
- **Un répertoire cible** : Assurez-vous que le répertoire cible sur lequel vous souhaitez écrire existe.

---

## Installation

1. Téléchargez ou copiez le fichier `fill_disk.sh` dans un répertoire de votre choix.
2. Le fichier est prêt à l'emploi, mais vous devez lui attribuer des droits d'exécution :
   ```bash
   chmod +x fill_disk.sh
   ```

---

## Utilisation

### Étapes

1. **Ouvrez un terminal**.
2. **Exécutez le script** avec le chemin du répertoire cible où vous souhaitez remplir l'espace disque.

   ```bash
   ./fill_disk.sh /chemin/vers/le/répertoire
   ```

   Remplacez `/chemin/vers/le/répertoire` par le chemin de votre répertoire cible.

3. **Le script fonctionnera comme suit** :
   - Il créera des fichiers de 10 Mo dans le répertoire spécifié.
   - Le nom des fichiers sera généré de manière unique à chaque itération (par exemple : `temp_file_10MB`, `temp_file_20MB`, etc.).
   - Le script continuera à remplir le disque jusqu'à ce que vous l'arrêtiez manuellement en appuyant sur `Ctrl + C`.

---

## Options

- **Taille des fichiers** : Le script crée des fichiers de 10 Mo par défaut. Vous pouvez modifier cette valeur en changeant la variable `BLOCK_SIZE_MB` dans le script à la ligne suivante :
  ```bash
  BLOCK_SIZE_MB=10
  ```
  Cette valeur peut être ajustée à n'importe quelle taille en Mo.

- **Répertoire cible** : Vous devez spécifier un chemin valide vers un répertoire où vous souhaitez remplir l'espace disque.

---

## Exemple d'exécution

### Exemple 1 : Exécution avec un répertoire cible

```bash
$ ./fill_disk.sh /home/user/tmp
Début du remplissage du disque dans /home/user/tmp...
Progression : 10 Mo écrits.
Progression : 20 Mo écrits.
Progression : 30 Mo écrits.
...
```

---

## Arrêter le script

Vous pouvez interrompre l'exécution du script à tout moment en appuyant sur **`Ctrl + C`** dans le terminal.

---

## Remarque

- **Droits d'administrateur** : Si vous souhaitez écrire dans un répertoire qui nécessite des privilèges d'administrateur, vous devrez exécuter le script avec `sudo` :
  ```bash
  sudo ./fill_disk.sh /path/to/directory
  ```
- Le script ne supprime pas automatiquement les fichiers une fois l'exécution terminée. Si vous souhaitez les supprimer, vous pouvez manuellement supprimer les fichiers dans le répertoire cible ou ajouter une logique de nettoyage à la fin du script.

---

## Nettoyage

Les fichiers générés par le script peuvent être supprimés manuellement ou en ajoutant des commandes de nettoyage à la fin du script, comme suit :
```bash
rm /chemin/vers/le/répertoire/temp_file_*
```

---