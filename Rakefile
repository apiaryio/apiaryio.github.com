require 'bundler'
Bundler.setup(:default)
require 'date'
require 'html-proofer'

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
    puts 'Starting the server locally on http://127.0.0.1:4000'
    sh 'open http://127.0.0.1:4000'
    sh 'bundle exec jekyll serve --watch --drafts --port 4000'
  end

  desc 'Runs a local server *without* draft posts and watches for changes'
  task :published do
    puts 'Starting the server locally on http://127.0.0.1:4000'
    sh 'open http://127.0.0.1:4000'
    sh 'bundle exec jekyll serve --watch --port 4000'
  end
end

desc 'Runs a local server with draft posts and watches for changes'
task :serve => 'serve:drafts'

task :default => :serve

desc 'Test build'
task :test do
  sh 'bundle exec jekyll doctor'
  sh 'bundle exec jekyll build --config _config.yml,_config_test.yml'

  HTMLProofer.check_directory('./_site', {
    :url_ignore => [
      /relishapp.com/, # blacklisted?
      /nike.com/, # blacklisted?
      /cognitive.cisco.com/, # blacklisted?
      /https:\/\/blog.apiary.io\/20/, # Prevent checking for unpublished articles
      /https:\/\/github\.com\/search/, # Prevent 429 limiting
    ],
    :typhoeus => {
      :headers => {
        "User-Agent" => "ApiaryBlogBot/1.0"
      }
    }
  }).run
end
