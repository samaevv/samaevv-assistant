# Maintainer: samaevv <email>
pkgname=samaevv-assistant
pkgver=0.1.0
pkgrel=1
pkgdesc="Ukrainian voice assistant «Джарвіс» for Omarchy/Hyprland: local wake word and speech recognition, plugins, control centre"
arch=('any')
url="https://github.com/samaevv/samaevv-assistant"
license=('custom')
depends=('python' 'ffmpeg' 'wtype' 'wl-clipboard' 'grim' 'libnotify' 'playerctl' 'pipewire-pulse' 'curl' 'mpv' 'yt-dlp')
optdepends=('nodejs: needed by the Claude / Codex command line brains'
            'tesseract: text from the screen plugin')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('a845ac35ebcfb66e525a78bbcda8bae9f136c4520c92546e3b084d7152fa2c92')

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/$pkgname/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/samaevv-assistant-setup" <<'SH'
#!/usr/bin/env bash
# Per-user setup: python environment, models, services, control-centre plugin.
exec /usr/share/samaevv-assistant/install.sh "$@"
SH
}
