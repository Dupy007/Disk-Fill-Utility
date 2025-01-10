@echo off
:: ================================
:: Script pour remplir un disque sous Windows
:: ================================

:: Vérifier si un chemin a été passé en argument
if "%~1"=="" (
    echo Utilisation : %~nx0 <chemin_du_dossier>
    exit /b 1
)

:: Définir la taille du fichier à 10 Mo
set BLOCK_SIZE_MB=10
set /a BLOCK_SIZE=BLOCK_SIZE_MB*1024*1024   :: 10 Mo en octets (1 Mo = 1024*1024 octets)
set TOTAL_WRITTEN=0

:: Définir le répertoire cible
set TARGET_DIR=%~1

:: Vérifier que le répertoire existe
if not exist "%TARGET_DIR%" (
    echo Erreur : Le répertoire "%TARGET_DIR%" n'existe pas.
    exit /b 1
)

:: Message de démarrage
echo Début du remplissage du disque dans "%TARGET_DIR%"...

:: Remplissage du disque
:fill_loop
:: Créer un fichier temporaire de 10 Mo avec un nom unique
echo %RANDOM% > "%TARGET_DIR%\temp_file_%TOTAL_WRITTEN%.txt"

:: Mise à jour du total écrit
set /a TOTAL_WRITTEN+=BLOCK_SIZE_MB

:: Affichage de la progression
echo Progression : %TOTAL_WRITTEN% Mo écrits.

:: Recommencer jusqu'à ce que l'utilisateur arrête
goto fill_loop

:end
echo Remplissage terminé.
exit /b 0
