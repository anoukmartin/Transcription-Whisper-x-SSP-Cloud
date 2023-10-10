# Service Python+Jupyter+Whisper sur le SSP Cloud

Répertoire contenant les différents fichiers nécessaires à la configuration d'un service python-jupyter-gpu sur le [SSP Cloud](https://github.com/InseeFrLab/onyxia-web/blob/main/README.md) dans le cadre de la transcription d'entretiens avec [Whisper](https://github.com/openai/whisper) d'[OpenAI](https://openai.com/)

## Tutoriel pour utiliser le service

Un tutoriel rapide expliquant comment transcrire un entretien avec Whsiper sur un service SSP Cloud

🔗 [**Lire le tutoriel**](https://github.com/anoukmartin/Transcription-Whisper-x-SSP-Cloud/blob/main/Tuto_transcription.md)

## Accéder directement au service préconfiguré

Ce lien permet de lancer un service avec toutes les configurations nécessaires pour l'utilisation de Whisper dans le cadre de la transcription de fichiers audio.

🔗 [**Accéder au service**](https://datalab.sspcloud.fr/launcher/ide/jupyter-python-gpu?autoLaunch=true&onyxia.friendlyName=«Transcription%20Whisper»&s3.enabled=false&kubernetes.enabled=false&resources.limits.cpu=«40000m»&resources.limits.memory=«200Gi»&git.enabled=false&vault.enabled=false&init.personalInit=«https%3A%2F%2Fraw.githubusercontent.com%2Fanoukmartin%2FTranscription-Whisper-x-SSP-Cloud%2Fmain%2FInitPy.sh»)

## Configurer manuellement un service SSPCloud

Plutôt que d'utiliser le lien ci-dessus vous pouvez configurer manuellement un service et enregistrer celui-ci dans votre environnement SSP Cloud

### 1. Choix du service

Dans son espace personnel se rendre dans l'onglet "Catalogue de services", en choisir le service "Jupyter-python-gpu" en cliquant sur "lancer".

### 2. Paramètres de ressources

La transcription d'audio est une opération lourde, elle nécessite un GPU pour avoir des performances optimales, mais aussi un processeur puissant et suffisamment de mémoire vive si l\'enregistrement audio à retranscrire est long. Dans le volet de configuration "Configuration Jupyter-python-gpu", renseigner l'onglet "Ressources" en réglant les curseurs CPU et Memory sur le maximum, et laisser Nvidia.com/GPU sur le minimum (1)

### 3. Script d'initialisation

Dans la pré configuration proposée ici, on installe Whisper et ses dépendances de manière automatique, et on copie le [Notebook jupyter](https://github.com/anoukmartin/Transcription-Whisper-x-SSP-Cloud/blob/main/Transcription_Whisper.ipynb) contenant le code et les instructions nécessaires à la transcription dans l'environnement Jupyter. Pour cela remplir l'onglet "Init" avec l'adresse suivante <https://raw.githubusercontent.com/anoukmartin/Transcription-Whisper-x-SSP-Cloud/main/InitPy.sh> dans le champ "PersonalInit".

### 4. Enregistrer la configuration

Pour ne pas avoir à refaire celle-ci, vous pouvez enregistrer cette configuration de service. Donner un nom à ce service configuré pour Whisper dans le champ "Nom personnalisé" (par exemple "Transcription Whisper"). Cliquer sur le symbole "enregistrement", puis sur "Lancer" pour sauvegarder définitivement cette configuration et lancer l'ouverture du service. Cette préconfiguration apparaîtra désormais dans votre espace "Mes services" comme service enregistré. Il ne sera plus nécessaire de réaliser toutes les étapes précédentes à chaque fois, vous n'aurez plus qu'a cliquer sur "Lancer" pour lancer Python-Jupyter pré configuré pour la transcription avec Whisper.
