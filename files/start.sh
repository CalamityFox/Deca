clear
echo
echo
echo -e "                 \e[1;96mDeca\e[0m\e[1;34m is an ostree/bootc system with \e[1;32mcinnamon\e[0m\e[0m"
echo -e "          ---------------------------------------------------------"
echo -e "        \e[1;34m The installer will install the \e[1;33mFlatpaks\e[0m \e[1;34mthat \e[1;96mdeca\e[0m \e[1;34mships with,\e[0m"
echo -e "        \e[1;34mthen rebase to\e[0m \e[1;96mdeca:latest\e[0m \e[1;34mfrom the\e[0m \e[1;33mGitHub Container Registry\e[0m"
echo -e "          ---------------------------------------------------------"
echo -e "            \e[1;35mYour current deployment will be pinned as a fallback,\e[0m"
echo -e "           \e[1;35mand your personal data will remain accessible in\e[0m \e[1;96mdeca\e[0m"
echo
echo -e "                          \e[1;34mType\e[0m \e[1;35m'\e[0m\e[1;96mdeca\e[0m\e[1;35m'\e[0m \e[1;34mto start\e[0m"
echo
read answer
if [[ $answer == "deca" ]]; then
    set -euo pipefail
    echo
    echo -e "  \e[1;5;95mThank You <3\e[0m" && sleep 2s
    echo
    echo -e "  \e[1;5;33mInstalling Flatpaks...\e[0m"
    FLATPAK=(
      app.devsuite.Ptyxis # Terminal
      app.drey.Warp # File sharing via `magic-wormhole`
      com.github.johnfactotum.Foliate # E-book reader
      com.github.tchx84.Flatseal # Flatpak permission manager
      de.haeckerfelix.Fragments # Torrent client
      io.github.kolunmi.Bazaar # App store
      io.gitlab.adhami3310.Impression # ISO flasher
      io.gitlab.librewolf-community # Browser
      org.gnome.Calculator # Calculator
      org.gnome.FileRoller # Archive utility
      org.gnome.Loupe # Image viewer
      org.gnome.Papers # Document viewer
      org.gnome.Showtime # Video player
      org.gnome.TextEditor # Text editor
      org.gnome.Weather # Weather
      org.gnome.World.Iotas # Notes
      org.gnome.World.PikaBackup # GUI for `borgbackup`
      org.gnome.World.Secrets # KeePass password manager
      org.libreoffice.LibreOffice # Office suite
      org.mozilla.thunderbird # E-mail client
      )
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    for APP in "$FLATPAK"; do
      flatpak install --noninteractive flathub "$APP"
    done
    
    mv -f $DECA/setup/bashrc ~/.bashrc
    mv -f $DECA/setup/background ~/.config/background
    mv -f $DECA/setup/sudoers /etc/sudoers
    mv -f $DECA/setup/flatpakconf/* ~/.var/app/
    
    hostnamectl set-hostname deca
    


else
    echo
    echo -e "  \e[1;91mOPERATION CANCELLED BY USER\e[0m"
    echo
    echo
fi
