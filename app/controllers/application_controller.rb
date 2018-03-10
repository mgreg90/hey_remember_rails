class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  before_action :create_or_authenticate_user

  private

  def current_user
    @current_user ||= create_or_authenticate_user
  end

  def create_or_authenticate_user
    User.find_or_create_by_android_device_uuid(args[:android_device_uuid])
  end

  def args
    @args ||= sanitize_params
  end

  def sanitize_params
    pams = params.clone

    pams[:android_device_uuid].try(:strip!)

    pams
  end

end
