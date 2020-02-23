if (( $+commands[aws] )); then
    source $(which aws)_zsh_completer.sh

    decrypt_kms() {
        aws kms decrypt --ciphertext-blob fileb://<(echo "$1" | base64 -d) --output text --query Plaintext | base64 -d
    }

    encrypt_kms() {
        aws kms encrypt --key-id "$1" --plaintext fileb://<(echo -n "$2")
    }

fi
