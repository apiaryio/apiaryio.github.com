#!/bin/bash
git config --global user.name "Apiary Bot"
git config --global user.email "support@apiary.io"
git remote set-url origin "https://${GH_TOKEN}@github.com/apiaryio/apiaryio.github.com"
bundle exec rake deploy
