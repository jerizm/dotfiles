decrypt_kms() {
    aws kms decrypt --ciphertext-blob fileb://<(echo "$1" | base64 -d) --output text --query Plaintext | base64 -d
}
encrypt_kms() {
    aws kms encrypt --plaintext "$1" --key-id "$2"
}

