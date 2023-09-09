#!/bin/bash

# Installation de ffmpeg
sudo apt update && sudo apt install -y ffmpeg

# Copie du notebook de transcription
wget https://raw.githubusercontent.com/anoukmartin/Transcription-Whisper-x-SSP-Cloud/main/Transcription_Whisper.ipynb

# Installation de WhisperOpenAI
pip install -U openai-whisper
