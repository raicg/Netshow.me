class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :public_page?

  layout :layout_by_resource

  def after_sign_in_path_for(resource)
    videos_path
  end

  def layout_by_resource
    if devise_controller?
      'login'
    elsif public_page?
      'clean'
    else
      'application'
    end
  end

  def public_page?
    request.fullpath.match?('/play') || request.fullpath.match?('/update_views')
  end
end
