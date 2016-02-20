require "sinatra/reloader" if development?

# set up sass

require "sass/plugin/rack"
Sass::Plugin.options[:style] = :compact
use Sass::Plugin::Rack 

# set up asset pipeline

register Sinatra::AssetPack
assets do 
  js :application, [
    '/bower_components/jquery/dist/jquery.min.js',
    '/bower_components/bootstrap/dist/js/bootstrap.min.js',
    '/js/app.js'
  ]
  css :application, [
    '/bower_components/bootstrap/dist/css/bootstrap.min.css',
    '/stylesheets/style.css'
  ]

  js_compression :jsmin 
  css_compression :simple
end

#Set up some helpers constants(CAPITAL LETTERS) to make our lives a little easier
APP_ROOT = Pathname.new(File.expand_path('../../',__FILE__))
APP_NAME = APP_ROOT.basename.to_s


# Set up the views directory 

configure do 
  set :views, File.join(APP_ROOT, "app", "views")
end

# require all our models controllers and helpers
["models", "controllers", "helpers"].each do |folder|
  Dir[APP_ROOT.join("app", folder, "*.rb")].each { |file| require file }
end
