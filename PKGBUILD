# Maintainer: samaevv
pkgname=samaevv-assistant
pkgver=0.3.0
pkgrel=1
pkgdesc="Ukrainian voice assistant «Джарвіс»: local wake word and speech recognition, plugins, browser control centre; Linux (Wayland/X11)"
arch=('any')
url="https://github.com/samaevv/samaevv-assistant"
license=('custom')
depends=('python' 'ffmpeg' 'curl' 'mpv' 'yt-dlp' 'playerctl' 'libnotify' 'libpulse')
optdepends=('wl-clipboard: clipboard on Wayland' 'wtype: typing on wlroots Wayland' 'grim: screenshots on wlroots Wayland'
            'xclip: clipboard on X11' 'xdotool: typing and windows on X11' 'wmctrl: windows on X11'
            'nodejs: for the Claude / Codex command line brains' 'tesseract: text from the screen plugin')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('85e7f59547bea85bfb3c1c3efe150138aae2d7385481a73110345a063c7ffadb')

package() {
  install -d "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/$pkgname-$pkgver/." "$pkgdir/usr/share/$pkgname/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/samaevv-assistant-setup" <<'SH'
#!/usr/bin/env bash
# Per-user setup: python environment, models, services, control centre.
exec /usr/share/samaevv-assistant/install.sh "$@"
SH
}
