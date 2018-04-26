# Monkey patch : Removes all comments completely
class Sass::Tree::Visitors::Perform < Sass::Tree::Visitors::Base
  def visit_comment(node)
    return []
  end
end

# Theme config
integento_theme_id = "Mytheme"
integento_theme_lang = "en_US"

# Compass config
http_path = "/"
css_dir = "pub/static/frontend/"+integento_theme_id+"/default/"+integento_theme_lang+"/css"
sass_dir = "app/design/frontend/"+integento_theme_id+"/default/styles"
images_dir = "assets/images"
javascripts_dir = "assets/js"
output_style = :compact
relative_assets = true
line_comments = false
preferred_syntax = :scss
