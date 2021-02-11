class EventsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :event_id_params, only:[:show, :edit, :update, :destroy]
  before_action :move_to_index_edit, only:[:edit, :destroy]
  def index
    @events = Event.order("created_at DESC").page(params[:page]).per(6).includes(:user)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  def search
    @events = Event.search(params[:keyword])
    @events = @events.order("created_at DESC").page(params[:page]).per(6).includes(:user)
  end

  private

  def event_params
    params.require(:event).permit(:name, :image, :explanation, :genre_id, :day, :start_time_id, :end_time_id, :capacity, :area_id, :place).merge(user_id: current_user.id)
  end

  def event_id_params
    @event = Event.find(params[:id])
  end

  def move_to_index_edit
    if current_user.id != @event.user_id 
      redirect_to root_path
    end
  end
end
