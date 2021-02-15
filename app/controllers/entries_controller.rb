class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event
  before_action :move_to_index_entry
  def index
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if @entry.valid?
      @entry.save
      redirect_to root_path, notice: 'イベント申し込みが送信されました'
    else
      render action: :index
    end
  end
  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def entry_params
    params.require(:entry).permit(:user_id, :event_id).merge(user_id: current_user.id, event_id: params[:event_id])
  end

  def move_to_index_entry
    if current_user.id == @event.user_id || @event.id.blank?
      redirect_to root_path
    end
  end

end
