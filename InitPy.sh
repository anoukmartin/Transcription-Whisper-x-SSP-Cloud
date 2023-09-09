#!/bin/bash

# On enregistre tous les logs dans log.out pour pouvoir déboguer
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>log.out 2>&1

# Pareil pour les variables d'environnement
env | sort > env_init.out

# Installation de WhisperOpenAI
pip install -U openai-whisper

# Installation de ffmpeg
sudo apt update && sudo apt install -y ffmpeg

# Copie du notebook de transcription
wget https://github.com/anoukmartin/Transcription-Whisper-x-SSP-Cloud/blob/main/Transcription_Whisper.ipynb

# Restitution des droit à l'utilisateur du service
chown -R ${USERNAME}:${GROUPNAME} ${HOME}
# ls -al /home/onyxia # avant work a un groupe 1000
chown -R ${USERNAME}:${GROUPNAME} ${HOME}
ls -al /home/onyxia # vérif

# Environnement final (pour déboguage)
env | sort > env_final.out
