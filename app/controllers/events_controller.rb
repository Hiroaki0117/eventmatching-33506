class EventsController < ApplicationController
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

  def search
    @events = Event.search(params[:keyword])
    @events = @events.order("created_at DESC").page(params[:page]).per(6).includes(:user)
  end

  private

  def event_params
    params.require(:event).permit(:name, :image, :explanation, :genre_id, :date, :capacity, :area_id, :place).merge(user_id: current_user.id)
  end


end
