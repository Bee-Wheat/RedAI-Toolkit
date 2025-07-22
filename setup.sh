#!/bin/bash

echo "🔧 Setting up your RedAI Toolkit environment..."

# Set project name and root path
PROJECT_NAME="RedAI-Toolkit"
ROOT_DIR="$HOME/$PROJECT_NAME"

# Create main project directories
mkdir -p "$ROOT_DIR"/{setup,tools/textattack_tests,tools/prompt_injection,tools/jailbreaks,logs,playbooks,reports,experiments}

# Move into project directory
cd "$ROOT_DIR" || exit 1

# Set up virtual environment
echo "📦 Creating Python virtual environment..."
python3 -m venv .venv
source .venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install requirements
echo "📥 Installing dependencies..."
pip install -r requirements.txt

# Create starter files
touch logs/init_log.md
touch setup/install_notes.md
echo "# $PROJECT_NAME" > README.md

# Git init (optional)
read -p "👉 Initialize Git repo? (y/n): " git_init
if [[ "$git_init" == "y" ]]; then
  git init
  git add .
  git commit -m "Initial commit: Bootstrap structure and venv"
  echo "✅ Git repo initialized."
fi

echo "✅ Setup complete. Activate with: source .venv/bin/activate"
echo "📁 Project located at: $ROOT_DIR"
