#!/bin/sh

# Params: $1=server hostname
SERVER_HOST=$1

echo === Generate server cert to be signed
openssl req -nodes -newkey rsa:2048 -keyout server.key -out server.csr \
-subj "/CN=$SERVER_HOST"

echo === Sign the server cert
cat > sign.ext << EOF
[ req ]
prompt = no
distinguished_name = req_distinguished_name
x509_extensions = san_self_signed
[ req_distinguished_name ]
CN=$SERVER_HOST
[ san_self_signed ]
subjectAltName = DNS:$SERVER_HOST, DNS:localhost, IP:127.0.0.1, IP:$SERVER_HOST
subjectKeyIdentifier = hash
authorityKeyIdentifier = keyid:always,issuer
basicConstraints = CA:true
keyUsage = nonRepudiation, digitalSignature, keyEncipherment, dataEncipherment, keyCertSign, cRLSign
extendedKeyUsage = serverAuth, clientAuth, timeStamping
EOF
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -extfile sign.ext

echo === Create server PEM file
cat server.key server.crt > server.pem
