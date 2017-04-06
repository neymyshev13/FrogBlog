class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout 'author'

  before_action :set_locale

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options ={})
    { locale: I18n.locale }.merge options
  end


end
