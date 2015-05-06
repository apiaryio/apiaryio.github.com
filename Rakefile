require 'date'

def slugify(title)
  "#{Time.now.strftime('%Y-%m-%d')}-#{title.gsub(/[^\w]+/, '-')}"
end

def get_filename(slug)
  File.join File.dirname(__FILE__), "_posts", "#{slug}.md"
end

def make_image_dir(slug)
  new_dir = File.join File.dirname(__FILE__), "images", slug
  Dir.mkdir new_dir
end

desc 'Create an unpublished post'
task :post, :title, :with_images do |t, args|
  args.with_defaults title: "New Post", with_images: false
  title = args.title
  slug = slugify title

  File.open get_filename(slug), "w" do |f|
    f << <<-EOS.gsub(/^    /, '')
    ---
    title: #{title}
    excerpt:
    layout: post
    date: #{Date.today.to_time}
    author:
    published: false
    ---

    EOS
  end

  make_image_dir slug if args.with_images
end

desc 'Create an image directory'
task :image_dir, :title do |t, args|
  args.with_defaults title: "New Post"
  title = args.title
  slug = slugify title
  make_image_dir slug
end

namespace :serve do
  desc 'Runs a local server *with* draft posts and watches for changes'
  task :drafts do
    puts 'Starting the server locally on http://localhost:4000'
    sh 'open http://localhost:4000'
    sh 'bundle exec jekyll serve --watch --drafts --port 4000'
  end

  desc 'Runs a local server *without* draft posts and watches for changes'
  task :published do
    puts 'Starting the server locally on http://localhost:4000'
    sh 'open http://localhost:4000'
    sh 'bundle exec jekyll serve --watch --port 4000'
  end
end

desc 'Runs a local server with draft posts and watches for changes'
task :serve => 'serve:drafts'

task :default => :serve

desc 'Deploy the blog to GitHub pages'
task :deploy do
  FileUtils.rm_rf '_gh-pages'
  puts 'Cloning gh-pages branch...'
  url = `git ls-remote --get-url origin`
  puts `git clone #{url.strip} _gh-pages`
  Dir.chdir('_gh-pages') do
    puts `git checkout --orphan gh-pages`
  end

  Dir.chdir('_gh-pages') do
    puts 'Pulling changes from server.'
    puts `git reset --hard`
    puts `git clean -xdf`
    puts `git checkout gh-pages`
    puts `git pull origin gh-pages`
  end

  puts 'Building site.'
  puts `bundle exec jekyll build -d _gh-pages`

  Dir.chdir('_gh-pages') do
    puts 'Pulling changes from server.'
    puts `git checkout gh-pages`
    puts `git pull origin gh-pages`

    puts 'Creating a commit for the deploy.'

    puts `git ls-files --deleted -z | xargs -0 git rm;`
    puts `git add .`
    puts `git commit -m "Deploy"`

    puts 'Pushing to github.'
    #puts `git push --quiet > /dev/null 2>&1`
  end
end

