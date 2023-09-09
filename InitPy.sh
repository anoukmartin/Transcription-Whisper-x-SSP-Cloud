#!/bin/bash

# Installation de ffmpeg
sudo apt update && sudo apt install -y ffmpeg

# Copie du notebook de transcription
wget https://raw.githubusercontent.com/anoukmartin/Transcription-Whisper-x-SSP-Cloud/main/Transcription_Whisper.ipynb

# Installation de WhisperOpenAI
pip install -U openai-whisper

# Restitution des droit à l'utilisateur du service
chown -R ${USERNAME}:${GROUPNAME} ${HOME}
ls -al /home/onyxia # avant work a un groupe 1000
