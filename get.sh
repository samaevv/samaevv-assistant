#!/usr/bin/env bash
# One-command install / update of samaevv-assistant (Jarvis) on Omarchy.
#   curl -fsSL https://raw.githubusercontent.com/samaevv/samaevv-assistant/main/get.sh | bash
# Re-run the same command to update. Your settings, notes and memory are never touched.
set -e
REPO="${SAMAEVV_REPO:-samaevv/samaevv-assistant}"
case "$REPO" in samaevv*) echo "Спершу заміни samaevv у get.sh на реальне ім'я репозиторію (або задай SAMAEVV_REPO=користувач/samaevv-assistant)"; exit 1;; esac
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
echo "== Завантажую samaevv-assistant з $REPO"
curl -fSL --progress-bar "https://github.com/$REPO/releases/latest/download/samaevv-assistant.tar.gz" -o "$tmp/pkg.tar.gz"
tar xzf "$tmp/pkg.tar.gz" -C "$tmp"
cd "$tmp"/samaevv-assistant-*
exec ./install.sh
