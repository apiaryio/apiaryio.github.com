echo "Setup local git"
git config --global user.name "Apiary Bot"
git config --global user.email "support@apiary.io"
git config --global user.name
git config --global user.email
echo "Setup git remote"
git remote set-url origin "https://${GH_TOKEN}@github.com/apiaryio/apiaryio.github.com"

echo "Run rake deploy"
git config --global -l
git config --local -l
bundle exec rake deploy
