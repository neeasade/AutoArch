for i in $(cat $1); do
    pacaur -S $i --noedit --needed --noconfirm;
done
