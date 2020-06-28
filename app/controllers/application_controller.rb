class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :videos_play_path?

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    videos_path
  end

  def layout_by_resource
    if devise_controller?
      'login'
    elsif videos_play_path?
      'clean'
    else
      'application'
    end
  end

  def videos_play_path?
    request.fullpath.match?('/play')
  end
end
