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
