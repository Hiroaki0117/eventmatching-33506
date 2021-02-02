class EventsController < ApplicationController
  def index
    @events = Event.order(created_at: "DESC").includes(:user)
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

  private

  def event_params
    params.require(:event).permit(:name, :image, :explanation, :genre_id, :date, :capacity, :area_id, :place).merge(user_id: current_user.id)
  end


end
