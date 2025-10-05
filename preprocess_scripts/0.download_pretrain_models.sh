#!/usr/bin/env bash
set -e

# Helper function: log messages with timestamp
log() {
    echo "[ $(date '+%Y-%m-%d %H:%M:%S') ] $1"
}

log "Starting pre-trained models download script..."

# Figure out the directory of the script itself
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
log "Script directory resolved to: $SCRIPT_DIR"

# Go up one level to reach the repo’s root
ROOT="$( dirname "$SCRIPT_DIR" )"
log "Repo root resolved to: $ROOT"

# Path to pretrained models folder in repo root
PRETRAIN_ROOT="$ROOT/pretrained_models"
log "Pretrained models directory: $PRETRAIN_ROOT"

# Create base folder
mkdir -p "$PRETRAIN_ROOT"
log "Created base pretrained_models directory."

# ------------------------------------------------------------------
# unit-based_HiFi-GAN_vocoder
# ------------------------------------------------------------------
VOCODER_ROOT="$PRETRAIN_ROOT/unit-based_HiFi-GAN_vocoder"
mkdir -p "$VOCODER_ROOT"
log "Created folder: $VOCODER_ROOT"

# --------------------- English ---------------------
EN_DIR="$VOCODER_ROOT/mHuBERT.layer11.km1000.en"
mkdir -p "$EN_DIR"
log "Created folder: $EN_DIR"
log "Downloading English vocoder files..."
wget -q --show-progress -P "$EN_DIR" https://dl.fbaipublicfiles.com/fairseq/speech_to_speech/vocoder/code_hifigan/mhubert_vp_en_es_fr_it3_400k_layer11_km1000_lj/g_00500000
wget -q --show-progress -P "$EN_DIR" https://dl.fbaipublicfiles.com/fairseq/speech_to_speech/vocoder/code_hifigan/mhubert_vp_en_es_fr_it3_400k_layer11_km1000_lj/config.json
log "English vocoder files downloaded."

# --------------------- Spanish ---------------------
ES_DIR="$VOCODER_ROOT/mHuBERT.layer11.km1000.es"
mkdir -p "$ES_DIR"
log "Created folder: $ES_DIR"
log "Downloading Spanish vocoder files..."
wget -q --show-progress -P "$ES_DIR" https://dl.fbaipublicfiles.com/fairseq/speech_to_speech/vocoder/code_hifigan/mhubert_vp_en_es_fr_it3_400k_layer11_km1000_es_css10/g_00500000
wget -q --show-progress -P "$ES_DIR" https://dl.fbaipublicfiles.com/fairseq/speech_to_speech/vocoder/code_hifigan/mhubert_vp_en_es_fr_it3_400k_layer11_km1000_es_css10/config.json
log "Spanish vocoder files downloaded."

# --------------------- French ---------------------
FR_DIR="$VOCODER_ROOT/mHuBERT.layer11.km1000.fr"
mkdir -p "$FR_DIR"
log "Created folder: $FR_DIR"
log "Downloading French vocoder files..."
wget -q --show-progress -P "$FR_DIR" https://dl.fbaipublicfiles.com/fairseq/speech_to_speech/vocoder/code_hifigan/mhubert_vp_en_es_fr_it3_400k_layer11_km1000_fr_css10/g_00500000
wget -q --show-progress -P "$FR_DIR" https://dl.fbaipublicfiles.com/fairseq/speech_to_speech/vocoder/code_hifigan/mhubert_vp_en_es_fr_it3_400k_layer11_km1000_fr_css10/config.json
log "French vocoder files downloaded."

# ------------------------------------------------------------------
# HuBERT model
# ------------------------------------------------------------------
MHUBERT_DIR="$PRETRAIN_ROOT/mHuBERT"
mkdir -p "$MHUBERT_DIR"
log "Created folder: $MHUBERT_DIR"
log "Downloading mHuBERT base model..."
wget -q --show-progress -P "$MHUBERT_DIR" https://dl.fbaipublicfiles.com/hubert/mhubert_base_vp_en_es_fr_it3.pt
wget -q --show-progress -P "$MHUBERT_DIR" https://dl.fbaipublicfiles.com/hubert/mhubert_base_vp_en_es_fr_it3_L11_km1000.bin
log "mHuBERT base model files downloaded."

log "All downloads completed successfully!"
