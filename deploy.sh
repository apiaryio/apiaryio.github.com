echo "Setup local git"
git config --local user.name "Apiary Bot"
git config --local user.email "support@apiary.io"
echo "Setup git remote"
git remote set-url origin "https://${GH_TOKEN}@github.com/apiaryio/apiaryio.github.com"

echo "Run rake deploy"
bundle exec rake deploy
