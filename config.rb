set :haml, :format => :html5, :ugly => true

page "tests.html", :layout => false

Dir['source/js/vendor/*'].each do |file|
  _, file = file.split(/\//, 2)
  ignore file
end

set :css_dir, "css"
set :js_dir, "js"
set :images_dir, "img"

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :cache_buster
end

activate :deploy do |deploy|
  deploy.method = :git
  deploy.branch = "master"
  deploy.build_before = true
end
