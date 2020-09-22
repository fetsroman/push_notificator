class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    @admin_user = AdminUser.find_by_email(admin_user_params[:email])
    if @admin_user && @admin_user.authenticate(admin_user_params[:password])
      session[:admin_user_id] = @admin_user.id
      redirect_to '/admin'
    else
      redirect_to '/admin/sign_in'
    end
  end

  private

  def admin_user_params
    params.permit(:email, :password)
  end
end
