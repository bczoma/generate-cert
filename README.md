# Generate CA and signed server/client certificates

Usage:
```
# Generate CA
src/generate-new-CA.sh

# Generate server cert: cert will include testserver in CN and SAN
./generate-server.sh testserver

# Generate client cert: cert will include testclient in CN
./generate-client.sh testclient
```