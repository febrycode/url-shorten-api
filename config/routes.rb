Rails.application.routes.draw do
  get '/:shortcode', to: 'shortens#show'
end
