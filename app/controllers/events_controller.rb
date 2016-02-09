class EventsController < ApplicationController

  def new
    @event = Event.new()
  end

  def show
    @event = Event.find(event_id)
  end

  def create
    event = Event.new(event_params)

    if event.valid?
      event.save
    else
      render 'errors', locals: { errors: event.errors.messages }
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def event_id
      params.require(:id).to_i
    end

    def event_params
      params.require(:event).permit(:id, :title, :location, :description, :starts_at, :ends_at, :color_code, :all_day)
    end
end

