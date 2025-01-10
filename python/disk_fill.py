import os
import tkinter as tk
from tkinter import filedialog, messagebox
import time


def fill_disk_single_process(temp_dir, block_size=1024 * 1024):
    """
    Remplit un disque de manière séquentielle en un seul processus.

    :param temp_dir: Répertoire pour stocker le fichier temporaire.
    :param block_size: Taille des blocs de données à écrire (en octets).
    """
    total_written = 0
    start_time = time.time()

    if not os.path.exists(temp_dir):
        os.makedirs(temp_dir)

    file_path = os.path.join(temp_dir, "disk_fill.tmp")

    try:
        with open(file_path, "wb") as temp_file:
            print("Début de l'écriture séquentielle...")
            while True:
                data = os.urandom(block_size)
                temp_file.write(data)
                total_written += block_size

                if total_written % (1024 * 1024 * 100) == 0:  # Affichage tous les 100 Mo
                    print(f"{total_written / (1024 * 1024):.2f} Mo écrits.")
    except OSError as e:
        print(f"Arrêté : {e}")
    finally:
        elapsed_time = time.time() - start_time
        total_mb = total_written / (1024 * 1024)
        print(f"Écriture terminée. Temps total : {elapsed_time:.2f} secondes.")
        print(f"Total écrit : {total_mb:.2f} Mo.")
        print("Nettoyage du fichier temporaire.")
        if os.path.exists(file_path):
            os.remove(file_path)
        print("Nettoyage terminé.")
        return elapsed_time, total_mb


def select_directory():
    """
    Ouvre une boîte de dialogue pour sélectionner un répertoire cible.
    """
    directory = filedialog.askdirectory()
    if directory:
        directory_label.config(text=f"Dossier sélectionné : {directory}")
        start_button.config(state="normal")
        global selected_directory
        selected_directory = directory
    else:
        messagebox.showwarning("Sélection de dossier", "Veuillez sélectionner un dossier.")


def start_fill():
    """
    Démarre le remplissage du disque de manière séquentielle.
    """
    block_size = int(block_size_var.get()) * 1024 * 1024

    if not selected_directory:
        messagebox.showwarning("Erreur", "Aucun dossier sélectionné.")
        return

    messagebox.showinfo("Démarrage", f"Le remplissage commence sur : {selected_directory}")
    elapsed_time, total_mb = fill_disk_single_process(selected_directory, block_size)
    messagebox.showinfo("Terminé", f"Le remplissage est terminé.\n"
                                   f"Temps total : {elapsed_time:.2f} secondes\n"
                                   f"Total écrit : {total_mb:.2f} Mo.")


# Interface graphique
root = tk.Tk()
root.title("Remplissage de disque")

# Variables globales
selected_directory = None
block_size_var = tk.StringVar(value="10")  # en Mo

# Sélection de dossier
select_button = tk.Button(root, text="Sélectionner un disque ou dossier", command=select_directory)
select_button.pack(pady=10)

directory_label = tk.Label(root, text="Aucun dossier sélectionné")
directory_label.pack(pady=5)

# Paramètres
block_size_label = tk.Label(root, text="Taille des blocs (en Mo) :")
block_size_label.pack()
block_size_entry = tk.Entry(root, textvariable=block_size_var)
block_size_entry.pack()

# Bouton démarrer
start_button = tk.Button(root, text="Démarrer le remplissage", state="disabled", command=start_fill)
start_button.pack(pady=20)

# Lancer l'interface graphique
root.mainloop()
