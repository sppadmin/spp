activate :blog do |b|
  b.prefix = "blog"
  b.permalink = "{title}"
  b.layout = "article_layout"
end

page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

configure :development do
  activate :livereload
end

ignore '**/*.swp'

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  activate :directory_indexes

  activate :s3_sync do |s3_sync|
    s3_sync.bucket                     = 'smartprivatepractice.com'
    s3_sync.region                     = 'us-east-1'
    s3_sync.after_build                = false # We do not chain after the build step by default.
    s3_sync.prefer_gzip                = true
    s3_sync.reduced_redundancy_storage = false
    s3_sync.acl                        = 'public-read'
    s3_sync.encryption                 = false
    s3_sync.prefix                     = ''
    s3_sync.version_bucket             = false
    s3_sync.index_document             = 'index.html'
    s3_sync.error_document             = '404.html'
  end
end

helpers do 
  def active(path)
    current_page.path == path ? {:class => "active"} : {}
  end
end
