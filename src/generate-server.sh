#!/bin/sh

# Params: $1=server hostname
SERVER_HOST=$1

echo === Generate server cert to be signed
openssl req -nodes -newkey rsa:2048 -keyout server.key -out server.csr \
-subj "/CN=$SERVER_HOST"

echo === Sign the server cert
cat > sign.ext << EOF
subjectAltName = @alt_names
[alt_names]
DNS.1 = $SERVER_HOST
EOF
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -extfile sign.ext

echo === Create server PEM file
cat server.key server.crt > server.pem
