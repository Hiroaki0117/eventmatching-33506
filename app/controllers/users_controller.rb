class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:mypage]
  before_action :set_user, only:[:show, :mypage]
  before_action :move_to_index_edit, only:[:mypage]

  def show
    @events = @user.events.order("created_at DESC").page(params[:page]).per(6)
  end

  def mypage
  end

  def new
  end

  

  private

  def set_user
    @user = User.find(params[:id])
  end

  def move_to_index_edit
    if current_user.id != @user.id 
      redirect_to root_path
    end
  end

end
