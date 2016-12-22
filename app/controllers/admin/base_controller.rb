class Admin::BaseController < ApplicationController

  before_action :require_admin
  skip_before_action :verify_user

  def require_admin
    render file: "/public/404" unless current_admin?
  end
 
end