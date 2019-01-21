decrypt_kms() {
    aws kms decrypt --ciphertext-blob fileb://<(echo "$1" | base64 -D) --output text --query Plaintext | base64 -D
}
encrypt_kms() {
    aws kms encrypt --plaintext "$1" --key-id "$2"
}

