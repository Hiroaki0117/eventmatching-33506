class EntriesController < ApplicationController
  before_action :set_item
  def index
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.valid?
      @entry.save
      redirect_to root_path
    else
      render action: :index
    end
  end
  private

  def set_item
    @event = Event.find(params[:event_id])
  end

  def entry_params
    params.require(:entry).permit(:user_id, :event_id).merge(user_id: current_user.id, event_id: params[:event_id])
  end
end
