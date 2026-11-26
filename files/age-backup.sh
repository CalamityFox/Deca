clear
set -eou pipefail
DATE=$(date +%Y%m%d)
key="$HOME/.meryyn-recovery-key"

if [[ ! -f $key ]]; then
    echo
    echo -e "\e[1;34m  Meryyn can back up your data with \e[1;33mage\e[1;34m,"
    echo -e "\e[1;34m  which uses a keyfile to encrypt and decrypt your data"
    echo
    echo -e "\e[1;34m  Alternatively, you can use \e[1;33mPika Backups\e[1;34m,"
    echo -e "\e[1;34m  which has a GUI and supports incremental backups"
    echo
    echo -e "\e[1;34m  For more info on how \e[1;33mage\e[1;34m works, head to:"
    echo -e "\e[1;33m  https://github.com/FiloSottile/age"
    echo
    echo -e "\e[1;31m  If you lose your age key you will not be able to recover your backups!"
    echo -e "\e[1;31m  This message will not appear again"
    echo
    echo -e "\e[1;31m  Type 'I understand' to continue:\e[0m"
    echo
    while true; do
    read -rp "  " reply
    [[ $reply == "I understand" ]] && age-keygen -pq -o .meryyn-recovery-key && echo -e "\e[1;34m  Key created at \e[1;33m$HOME/.meryyn-recovery-key\e[1;34m," && break
    echo -e "\e[1;31m  ERROR: Type 'I understand' to continue:"
done
fi

echo
echo -e "\e[1;34m  Select the directory to save the backup,\e[0m"
echo -e "\e[1;34m  e.g. \e[1;33m/run/media/$(whoami)/path/to/backup\e[0m"
echo
read -rp "  " TARGET

[[ -d $TARGET ]] || { echo -e "\e[1;35m  Error: '$TARGET' is not a directory\e[0m" >&2; exit 1; }

tar --create --xz --verbose $HOME | age -e -i=$HOME/.meryyn-recovery-key > "$TARGET/$(whoami)"-backup-"$DATE".tar.xz.age

echo -e "\e[1;34m  Data backed up succesfully!"
echo
echo -e "\e[1;34m  To decrypt, run:"
echo -e "\e[1;33m  age -d /path/to/backup.age > /path/to/backup"
echo
echo -e "\e[1;33m  .meryyn-recovery-key \e[1;34mis required for decryption"
echo
