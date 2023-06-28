#!/bin/sh

echo === Generate self signed root CA cert
openssl req -nodes -x509 -newkey rsa:2048 -keyout ca.key -out ca.crt -subj "/O=SolaceTest/OU=SecureSession/CN=SolaceTestCA"

