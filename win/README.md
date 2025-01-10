
# Remplir un disque sous Windows (fill_disk.bat)

## Description

Ce script batch permet de remplir un disque en créant des fichiers temporaires de taille définie. Le processus continue jusqu'à ce que l'utilisateur l'arrête manuellement. Ce script est utile pour tester l'espace disponible et le remplissage d'un disque. Il peut être exécuté à partir de l'invite de commandes ou de PowerShell sous Windows.

---

## Prérequis

- **Système d'exploitation** : Windows (Windows 7, 8, 10, 11)
- **Permissions d'administrateur** : Assurez-vous d'avoir les droits nécessaires pour créer et supprimer des fichiers dans le répertoire cible.
- **Un répertoire cible** : Vous devez spécifier un répertoire où vous souhaitez remplir l'espace disque.

---

## Installation

1. Téléchargez ou copiez le fichier `fill_disk.bat` dans un répertoire de votre choix.
2. Le fichier est prêt à l'emploi, aucune installation supplémentaire n'est requise.

---

## Utilisation

### Étapes

1. **Ouvrez l'invite de commandes ou PowerShell** :
   - **Invite de commandes** : Appuyez sur `Windows + R`, tapez `cmd`, puis appuyez sur `Entrée`.
   - **PowerShell** : Appuyez sur `Windows + X`, puis sélectionnez `Windows PowerShell`.

2. **Exécutez le script** avec le chemin du répertoire cible où vous souhaitez remplir l'espace disque.

   - **En Invite de Commandes (CMD)** :
     ```cmd
     fill_disk.bat D:	mp
     ```
   - **En PowerShell** :
     Si vous obtenez une erreur de syntaxe, utilisez la commande suivante pour exécuter le script dans un environnement CMD :
     ```powershell
     cmd.exe /c .ill_disk.bat D:	mp
     ```

   Remplacez `D:	mp` par le chemin de votre répertoire cible.

3. **Le script fonctionnera comme suit** :
   - Il créera des fichiers de 10 Mo dans le répertoire spécifié.
   - Chaque fichier sera nommé de manière unique, par exemple : `temp_file_10.txt`, `temp_file_20.txt`, etc.
   - Le script continue à remplir le disque jusqu'à ce que vous l'arrêtiez manuellement avec `Ctrl + C`.

---

## Options

- **Taille des fichiers** : Le script crée des fichiers de 10 Mo par défaut. Vous pouvez modifier cette valeur en changeant la variable `BLOCK_SIZE_MB` dans le script à la ligne suivante :
  ```bat
  set BLOCK_SIZE_MB=10
  ```
  Cette valeur peut être ajustée à n'importe quelle taille en Mo.

- **Répertoire cible** : Vous devez spécifier un chemin valide vers un répertoire où vous souhaitez remplir l'espace disque.

---

## Exemple d'exécution

- **Dans l'invite de commandes** :
  ```cmd
  C:\> fill_disk.bat D:	mp
  Début du remplissage du disque dans "D:	mp"...
  Progression : 10 Mo écrits.
  Progression : 20 Mo écrits.
  Progression : 30 Mo écrits.
  ...
  ```
  
- **Dans PowerShell** :
  ```powershell
  PS C:\> cmd.exe /c .ill_disk.bat D:	mp
  Début du remplissage du disque dans "D:	mp"...
  Progression : 10 Mo écrits.
  Progression : 20 Mo écrits.
  Progression : 30 Mo écrits.
  ...
  ```

---

## Arrêter le script

Vous pouvez interrompre l'exécution du script à tout moment en appuyant sur **`Ctrl + C`** dans la fenêtre de l'invite de commandes ou PowerShell.

---

## Remarque

- **Droits d'administrateur** : Assurez-vous que vous avez les droits nécessaires pour écrire dans le répertoire cible.
- Le script crée des fichiers temporaires pour remplir l'espace disque et peut prendre un certain temps selon la taille du disque et la vitesse de votre système.

---

## Nettoyage

Le script ne supprime pas automatiquement les fichiers une fois l'exécution terminée. Si vous souhaitez les supprimer, vous pouvez manuellement supprimer les fichiers dans le répertoire cible. Vous pouvez également modifier le script pour ajouter une commande de nettoyage si nécessaire.

---

Merci d'utiliser ce script ! Si vous avez des questions ou des problèmes, n'hésitez pas à me contacter.
