Rails.application.routes.draw do
  resources :urls
  root to: 'urls#index'

  get '/:short_code' => 'urls#srtly', as: :srtly
end
