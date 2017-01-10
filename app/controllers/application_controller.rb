class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  ROOT_URL='http://localhost:3000/'
end
