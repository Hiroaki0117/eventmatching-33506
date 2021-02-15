class EventsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  before_action :event_id_params, only:[:show, :edit, :update, :destroy]
  before_action :move_to_index_edit, only:[:edit, :destroy]
  before_action :search_event, only:[:index, :search]
  def index
    @events = Event.order("created_at DESC").page(params[:page]).per(6).includes(:user)
    set_event_column
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path, notice: 'イベントの投稿が完了しました'
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
      redirect_to event_path, notice: 'イベントの編集が完了しました'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: 'イベントが消去されました'
  end

  def search
    @events = @p.result.includes(:user)
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

  def search_event
    @p = Event.ransack(params[:q])
    set_event_column
  end

  def set_event_column
    @events_genre = Genre.where.not(id:1)
    @events_area = Area.where.not(id:1)
  end
end
