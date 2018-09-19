echo "Setup global git"
git config --global user.name "Apiary Bot"
git config --global user.email "support@apiary.io"

printf "\n# Setup git remote\n"
REMOTE="https://${GH_TOKEN}@github.com/apiaryio/apiaryio.github.com"
git remote set-url origin $REMOTE

printf "\n# Clone gh-pages\n"
rm -rf _gh-pages
git clone $REMOTE _gh-pages

cd _gh-pages
git checkout gh-pages
git reset --hard
git clean -xdf

printf "# \nRun build\n"
cd ..
chmod -R 777 _gh-pages
bundle exec jekyll build -d _gh-pages

cd _gh-pages

printf "\n# Cleanup and push\n"
git checkout gh-pages
git pull origin gh-pages
git ls-files --deleted -z | xargs -0 git rm;
git add .
git commit -m "Deploy"
git push
