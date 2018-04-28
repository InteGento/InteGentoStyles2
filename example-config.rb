# Monkey patch : Removes all comments completely
class Sass::Tree::Visitors::Perform < Sass::Tree::Visitors::Base
  def visit_comment(node)
    return []
  end
end

# Theme config
integento_theme_id = "Mytheme"
integento_theme_lang = "fr_FR"
integento_theme_lang2 = "en_US"

# Magento 2 config
integento_css_dir = "pub/static/frontend/" + integento_theme_id + "/default/"

# Compass config
http_path = "/"
css_dir = integento_css_dir + integento_theme_lang + "/css"
css2_dir = integento_css_dir + integento_theme_lang2 + "/css"
sass_dir = "app/design/frontend/" + integento_theme_id + "/default/styles"
images_dir = "assets/images"
javascripts_dir = "assets/js"
output_style = :compact
relative_assets = true
line_comments = false
preferred_syntax = :scss

# Copy to a secondary dir
require 'fileutils'
  on_stylesheet_saved do |file|
      if File.exists?(file)
      new_file = css2_dir + "/" + File.basename(file, File.extname(file)) + File.extname(file);
      FileUtils.cp(file, new_file);
  end
end
