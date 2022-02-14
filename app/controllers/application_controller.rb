class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private
  def record_not_found  
    render file: 'public/404.html', layout: false, status: 404
  end

  def authenticate_admin
    unless current_user.try(:admin?)
      flash[:alert] = "操作不允許。"
      redirect_to root_path
    end
  end
end
