# Installing


- `sudo gem update --system`
- `sudo gem install jekyll`

# Running

- `jekyll serve -w`

The server will automatically recompile all the changes you make to text files, except for `_config.yml`. In order to see changes to `_config.yml`, you need to restart the server manually.

# Stylesheet Development

The server references Apiary website production stylesheet (`apiary.io/homepage/css/style.css`). In order to change this to `apiary.local` for development purposes, edit the `static` variable in `_config.yml`. Make sure not to commit this to Github. Also, make sure your CSS changes are deployed on Apiary before pushing blog changes to Github.