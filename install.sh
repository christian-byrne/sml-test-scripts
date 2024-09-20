#!/bin/bash
sudo apt update
sudo apt install smlsharp
cd wiki
npm install
chmod +x ./start-wiki
chmod +x ./test
#npx update-browserlist-db@latest
cd ..

