class LikesController < ApplicationController

  def create 
    @like = current_user.likes.create(event_id: params[:event_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @like = current_user.likes.find_by(event_id: @event.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end

