Rails.application.routes.draw do
  resource :url
  root to: 'urls#index'

  get '/:short_url' => 'urls#srtly'
end
