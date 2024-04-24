# Generate self-signed CA and signed server/client certificates

Usage:
```
# Step 1: Generate CA
`src/generate-new-CA.sh`

# Step 2: Generate server key&cert: cert will include testserver in CN and SAN
`src/generate-server.sh testserver`

Output pem can be deployed on the broker.

# Step 3 (optional): Generate client cert: cert will include testclient in CN
`src/generate-client.sh testclient`

Output can be used by clients when using mTLS.
```
