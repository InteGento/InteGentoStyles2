# Theme config
integento_theme_id = "Mytheme"
integento_theme_lang = "fr_FR"
integento_theme_lang_supp = ["en_EN"]

# Magento 2 config
integento_css_dir = "pub/static/frontend/" + integento_theme_id + "/default/"

# Compass config
http_path = "/"
css_dir = integento_css_dir + integento_theme_lang + "/css"
sass_dir = "app/design/frontend/" + integento_theme_id + "/default/styles"
images_dir = "assets/images"
javascripts_dir = "assets/js"
output_style = :compact
relative_assets = true
line_comments = false
preferred_syntax = :scss

# Removes all comments completely
class Sass::Tree::Visitors::Perform < Sass::Tree::Visitors::Base
  def visit_comment(node)
    return []
  end
end

# Clean up generated CSS file
on_stylesheet_saved do |filename|
  css = File.open(filename, 'r')
  content = css.read
  # Remove double line breaks
  content = content.gsub("\n\n", "\n")
  # Remove trailing spaces
  content = content.gsub(/\s*\n\s*/, "\n")
  content = content.gsub(/[ ]?([,:;\{\}\>\+])[ ]?/, "\\1")
  content = content.gsub(/\@media\ \(/, "@media(")
  # Useless semicolon
  content = content.gsub(/;\}/, "}")
  # Save file
  File.write(filename, content)
end

# Copy to a secondary dir
require 'fileutils'
  on_stylesheet_saved do |file|
  if File.exists?(file)
    integento_theme_lang_supp.each do |i|
      new_file = integento_css_dir + i + "/css/" + File.basename(file, File.extname(file)) + File.extname(file);
      FileUtils.cp(file, new_file);
    end
  end
end
