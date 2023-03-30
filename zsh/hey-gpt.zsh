hey_gpt () {
    gpt=$(curl https://api.openai.com/v1/chat/completions -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
        "model": "gpt-3.5-turbo",
        "messages": [{"role": "user", "content": "'$1'"}],
        "temperature": 0.7
    }')
    echo -E $gpt | jq -r '.choices[0].message.content'
}
alias h=hey_gpt

img_gpt () {
    create_img=$(curl https://api.openai.com/v1/images/generations -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
        "prompt": "'$1'",
        "n": 1,
        "size": "1024x1024"
    }')
    echo -E $create_img | jq
    url=$(echo -E $create_img | jq -r '.data[0].url')
    rand_num=$(shuf -i 1-1000000 -n 1)
    curl -s $url -o img-"$rand_num".png
}
