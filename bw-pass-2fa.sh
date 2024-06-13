#!/bin/zsh
bw list items | jq -c '[.[] | {name: .name, login: .login.totp}] | .[]' | while read i; do
    name=$(echo $i | jq -r '.name')
    totp=$(echo $i | jq -r '.login')
    typeset -l output
    if [[ $totp == "null" ]]; then
        continue
    fi
    name=$(echo $name | xargs)
    name=${name//\(/_}
    name=${name//\)/}
    parts=(${(@s:(:)name})
    first=${(@j:/:)parts[1]}
    output=$(echo " $first " | xargs)
    output=${output// /_}
    output=${output//__/_}
    name=$output
    echo 2fa/$name
    echo $totp
    echo '\r'
    echo Adding entry for "2fa/$name":
    echo -e $totp | pass insert --multiline --force "2fa/$name"
    test $? && echo "Added!"
done
