decrypt_kms() {
    aws kms decrypt --ciphertext-blob fileb://<(echo "$1" | base64 -d) --output text --query Plaintext | base64 -d
}

encrypt_kms() {
    aws kms encrypt --key-id "$1" --plaintext fileb://<(echo -n "$2")
}

# Roles with requireMFA trust only MFA under 1h old (hiatus.ops.iam AccountMFAPrincipal)
export AWS_SESSION_TOKEN_TTL=3500s
export AWS_CHAINED_SESSION_TOKEN_TTL=3500s
