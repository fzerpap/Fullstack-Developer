# Be sure to restart your server when you modify this file.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( static.css )
Rails.application.config.assets.precompile += %w( users/profiles.css )
Rails.application.config.assets.precompile += %w( lecciones.css )
Rails.application.config.assets.precompile += %w( roles.js )
Rails.application.config.assets.precompile += %w( users/registrations.js )
Rails.application.config.assets.precompile += %w( empresas.js )
Rails.application.config.assets.precompile += %w( users/profiles.js )
Rails.application.config.assets.precompile += %w( users/settings.js )
Rails.application.config.assets.precompile += %w( users/sessions.js )
Rails.application.config.assets.precompile += %w( users/client_users.js )
Rails.application.config.assets.precompile += %w( static.js )
Rails.application.config.assets.precompile += %w( cocoon.js )
Rails.application.config.assets.precompile += %w( countries.js )
Rails.application.config.assets.precompile += %w( states.js )
Rails.application.config.assets.precompile += %w( roles.js )
Rails.application.config.assets.precompile += %w( caixa_principals.js )
Rails.application.config.assets.precompile += %w( despesas.js )
Rails.application.config.assets.precompile += %w( compras.js )
Rails.application.config.assets.precompile += %w( folha_debitos.js )
Rails.application.config.assets.precompile += %w( maquinas.js )
Rails.application.config.assets.precompile += %w( funcionarios.js )
Rails.application.config.assets.precompile += %w( fornecedors.js )
Rails.application.config.assets.precompile += %w( cartao_creditos.js )
Rails.application.config.assets.precompile += %w( egressos.js )
Rails.application.config.assets.precompile += %w( bancos.js )
Rails.application.config.assets.precompile += %w( conta_bancaria.js )
Rails.application.config.assets.precompile += %w( ponto_vendas.js )
Rails.application.config.assets.precompile += %w( conta_pagars.js )
Rails.application.config.assets.precompile += %w( empresas.js )
Rails.application.config.assets.precompile += %w( roles.css )
Rails.application.config.assets.precompile += %w( egressos.css.scss )

Rails.application.config.assets.precompile +=
    %w(*.png *.jpg *.jpeg *.gif vendor/somefile.js vendor/somefile.css \
     vendor/bootstrap/*.js vendor/bootstrap/*.css \
     vendor/bootstrap/**/*.js vendor/bootstrap/**/*.css)


# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css.scss, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
