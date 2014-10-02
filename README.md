
# Steps to create a blog post

 - Clone the repo: https://github.com/apiaryio/apiaryio.github.com
 - Create a new branch and add file under the `_posts` folder using the naming 
 convention: `yyyy-mm-dd-name-of-blog.md`
 - Add images under the `_images` folder and make them either .png or .jpeg format. The width of the image should be 640px.
 - Add your details in the _config.yml file to be configured as an author.
 - Run jekyll to see the file locally on [localhost:4000](http://localhost:4000)
 - Commit your file and get it reviewed by other team members by sending pull requests
 - After reviewing, oncall person will merge the pull request


# Installing jekyll


- `sudo gem update --system`
- `sudo gem install jekyll`

# Running jekyll

- `jekyll serve -w`

The server will automatically recompile all the changes you make to text files, except for `_config.yml`. In order to see changes to `_config.yml`, you need to restart the server manually.

# Stylesheet Development

The server references Apiary website production stylesheet (`apiary.io/homepage/css/style.css`). In order to change this to `apiary.local` for development purposes, edit the `static` variable in `_config.yml`. Make sure not to commit this to Github. Also, make sure your CSS changes are deployed on Apiary before pushing blog changes to Github.
