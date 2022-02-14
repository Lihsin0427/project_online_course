class AdminsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def become_admin
    current_user.update_attribute :admin, true
    redirect_to admins_path, notice: "您成為管理員了。"
  end

  def cancel_admin
    current_user.update_attribute :admin, false
    redirect_to admins_path, notice: "您現在不是管理員了。"
  end

end
