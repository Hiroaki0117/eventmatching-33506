class EntriesController < ApplicationController
  before_action :set_item
  def index
    
  end

  private

  def set_item
    @event = Event.find(params[:event_id])
  end
end
