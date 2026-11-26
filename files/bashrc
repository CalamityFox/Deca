# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Meryyn
clear
echo
echo -e "\e[1;34m            Welcome to \e[1;96mMeryyn\e[1;34m! \e[0m"
echo -e "\e[1;96m          ---------------------"
echo -e "\e[1;34m        update \e[1;96m|\e[1;34m update system and applications \e[0m"
echo -e "\e[1;34m      rollback \e[1;96m|\e[1;34m boot previous ostree update"
echo -e "\e[1;34m        backup \e[1;96m|\e[1;34m backup home folder with age"
echo
alias 'update'="set -eou pipefail && flatpak update --noninteractive && rpm-ostree update --quiet --reboot"
alias 'rollback'="set -eou pipefail && rpm-ostree rollback --quiet --reboot"
alias 'backup'="/usr/share/meryyn/age-backup.sh"
