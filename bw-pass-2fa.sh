#!/bin/zsh
bw list items --folderid e4c98e91-aada-4001-9cde-8dc6710fa0dc | jq -c '[.[] | {name: .name, login: .login.totp}] | .[]' | while read i; do
    name=$(echo $i | jq -r '.name')
    totp=$(echo $i | jq -r '.login')
    echo 2fa/$name
    echo $totp
    echo '\r'
    echo Adding entry for "2fa/$name":
    echo -e $totp | pass insert --multiline --force "2fa/$name"
    test $? && echo "Added!"
done
