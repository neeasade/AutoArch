for i in $(cat $1); do
    yaourt -S $i --noconfirm;
done
