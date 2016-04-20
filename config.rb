###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

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
