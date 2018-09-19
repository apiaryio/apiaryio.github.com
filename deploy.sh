echo "Setup global git"
git config --global user.name "Apiary Bot"
git config --global user.email "support@apiary.io"

echo "\n"
echo "Setup git remote"
REMOTE="https://${GH_TOKEN}@github.com/apiaryio/apiaryio.github.com"
git remote set-url origin $REMOTE

echo "\n"
echo "Clone gh-pages"
rm -rf _gh-pages
git clone $REMOTE _gh-pages

cd _gh-pages
git checkout gh-pages
git reset --hard
git clean -xdf

echo "\n"
echo "Run build"
cd ..
chmod -R 777 _gh-pages
bundle exec jekyll build -d _gh-pages

cd _gh-pages

echo "\n"
echo "Cleanup and push"
git checkout gh-pages
git pull origin gh-pages
git ls-files --deleted -z | xargs -0 git rm;
git add .
git commit -m "Deploy"
git push
