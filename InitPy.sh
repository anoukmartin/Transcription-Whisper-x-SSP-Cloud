#!/bin/bash

# Installation de ffmpeg
sudo apt update && sudo apt install -y ffmpeg

# Installation de WhisperOpenAI
pip install -U openai-whisper

# Copie du notebook de transcription
wget https://raw.githubusercontent.com/anoukmartin/Transcription-Whisper-x-SSP-Cloud/main/Transcription_Whisper.ipynb

# Ouverture du notebook 
IPYNB_PATH=Transcription_Whisper.ipynb
[ -z "$IPYNB_PATH" ] || echo "\nc.NotebookApp.default_url = '/tree/work/${IPYNB_PATH}'" >> /home/jovyan/.jupyter/jupyter_notebook_config.py
