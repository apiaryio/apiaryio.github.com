
# Steps to create a blog post

 - Clone the repo: https://github.com/apiaryio/apiaryio.github.com
 - Create a new brach and add file under the _posts folder
 - Add images under the _images folder and make them either in png or jpeg format. The dimensions of the image should be around 640x513
 - Add your details under _config.yml file to be added as an author
 - Run jekyll to see the file locally on localhost:4000
 - Commit your file and get it reviewed by other team members by sending pull requests
 - After reveiwing, merge the pull request
 

# Installing jekyll


- `sudo gem update --system`
- `sudo gem install jekyll`

# Running jekyll

- `jekyll serve -w`

The server will automatically recompile all the changes you make to text files, except for `_config.yml`. In order to see changes to `_config.yml`, you need to restart the server manually.

# Stylesheet Development

The server references Apiary website production stylesheet (`apiary.io/homepage/css/style.css`). In order to change this to `apiary.local` for development purposes, edit the `static` variable in `_config.yml`. Make sure not to commit this to Github. Also, make sure your CSS changes are deployed on Apiary before pushing blog changes to Github.