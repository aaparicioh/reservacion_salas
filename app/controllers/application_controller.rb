class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url, :alert => exception.default_message = " Se ha creado su reservación satisfactoriamente. " 
  end
end
