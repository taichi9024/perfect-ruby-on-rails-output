class ResignController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: session[:user_id])
    @user.destroy!
    reset_session
    redirect_to :events
  end

end
