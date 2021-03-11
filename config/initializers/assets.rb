# Be sure to restart your server when you modify this file.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( static.css )
Rails.application.config.assets.precompile += %w( users/profiles.css )
Rails.application.config.assets.precompile += %w( users/registrations.js )
Rails.application.config.assets.precompile += %w( users/profiles.js )
Rails.application.config.assets.precompile += %w( users/settings.js )
Rails.application.config.assets.precompile += %w( users/sessions.js )
Rails.application.config.assets.precompile += %w( static.js )
Rails.application.config.assets.precompile += %w( file_users.js )
Rails.application.config.assets.precompile += %w( cocoon.js )


Rails.application.config.assets.precompile +=
    %w(*.png *.jpg *.jpeg *.gif vendor/somefile.js vendor/somefile.css \
     vendor/bootstrap/*.js vendor/bootstrap/*.css \
     vendor/bootstrap/**/*.js vendor/bootstrap/**/*.css)


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
