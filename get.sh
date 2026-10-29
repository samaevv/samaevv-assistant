#!/usr/bin/env bash
# One-command install / update of samaevv-assistant (Джарвіс) on Linux (Arch/Omarchy, Ubuntu/Debian, Fedora, openSUSE).
#   curl -fsSL https://raw.githubusercontent.com/samaevv/samaevv-assistant/main/get.sh | bash
# Re-run the same command to update. Your settings, notes and memory are never touched.
set -e
REPO="${SAMAEVV_REPO:-samaevv/samaevv-assistant}"
tmp="$(mktemp -d)"; trap 'rm -rf "$tmp"' EXIT
echo "== Завантажую samaevv-assistant з $REPO"
curl -fSL --progress-bar "https://github.com/$REPO/releases/latest/download/samaevv-assistant.tar.gz" -o "$tmp/pkg.tar.gz"
tar xzf "$tmp/pkg.tar.gz" -C "$tmp"
cd "$tmp"/samaevv-assistant-*
[ -n "$SAMAEVV_DRY" ] && { echo "(пробний запуск) файли в $(pwd):"; ls | head -30; exit 0; }
exec ./install.sh
