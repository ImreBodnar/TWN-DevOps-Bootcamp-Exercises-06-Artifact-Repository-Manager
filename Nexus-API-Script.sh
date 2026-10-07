#!/bin/bash

# Extract the download URL.
curl -u super_user:q1w2e3r4 -X GET 'http://161.35.197.245:8081/service/rest/v1/components?repository=NPM-Repo-1' | jq -r '.items[0].assets[0].downloadUrl' > artifacturl.txt
artifactUrl = $(cat artifacturl.txt)

echo "Downloading artifact from: $artifactUrl"

# Download and unzip the artifact.
wget "$artifactUrl" -O myapp.tgz
tar -xzvf myapp.tgz

# Install dependencies and run.
cd package
npm install
node server.js