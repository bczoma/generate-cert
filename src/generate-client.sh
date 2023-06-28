#!/bin/sh

# Params: $1=client hostname
CLIENT_HOST=$1

echo === Generate client cert to be signed
openssl req -nodes -newkey rsa:2048 -keyout client.key -out client.csr -subj "/CN=$CLIENT_HOST"

echo === Sign the client cert
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAserial ca.srl -out client.crt

echo === Create client PEM file
cat client.key client.crt > client.pem
