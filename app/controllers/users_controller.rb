class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  before_action :set_user, only:[:show, :mypage]
  
  def show
    @events = @user.events.order("created_at DESC").page(params[:page]).per(6)
  end

  def mypage
  end

  

  private

  def set_user
    @user = User.find(params[:id])
  end

end
