
# Apiary Blog

## What not to do

* Do not rename the repo as apiaryio.github.io

## Steps to create a blog post

 - Clone the repo: https://github.com/apiaryio/apiaryio.github.com
 - Create a new branch and add file under the `_posts` folder using the naming
 convention: `yyyy-mm-dd-name-of-blog.md` (you can use the rake command below)
 - Add images under the `images` folder and make them either .png or .jpeg format. The width of the image should be 640px. If you have images you can use the rake command below for creating an image directory.
 - Add your details in the _config.yml file to be configured as an author.
 - Run jekyll to see the file locally on [localhost:4000](http://localhost:4000) with `rake serve`
 - Commit your file and get it reviewed by other team members by sending pull requests
 - After reviewing, oncall person will merge the pull request


## Installing Dependencies

```bash
$ bundle install
```

## Development

To start a local server that shows all posts including drafts:

```bash
$ rake serve
```

The server will automatically recompile all the changes you make to text files, except for `_config.yml`. In order to see changes to `_config.yml`, you need to restart the server manually.

## Rake Usage

There are some rake commands that can be used for creating post files and image directories.

### Post

#### Create Post

```bash
rake post['Hello World']
```

#### Create Post with Image Directory

If your post has images, you can specify `:with_images` in the rake command and it will create an empty directory inside the `images` directory.

```bash
rake post['Hello World',:with_images]
```

### Image Directory

```bash
rake image_dir['Hello World']
```

## Stylesheet Development 

The server directly references Apiary [website production stylesheet](https://github.com/apiaryio/apiary/blob/master/public/styles/modules/website.styl). In order to change this to `https://static.apiary.dev:9000` for development purposes, edit the `static` variable in `_config.yml`. Make sure not to commit this to Github. Also, make sure your CSS changes are deployed on Apiary before pushing blog changes to Github.
