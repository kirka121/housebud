class EventsController < ApplicationController

  def new
    @event = Event.new(starts_at: event_params[:date], ends_at: event_params[:date])
  end

  def show
    @event = Event.find(event_id)
    @top = event_position[:top]
    @left = event_position[:left]
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
    @event = Event.find(event_id)
  end

  def update
    event = Event.find(event_id)
    event.update(event_params)

    if event.valid?
      event.save
    else
      render 'errors', locals: { errors: event.errors.messages }
    end
  end

  def destroy
    event = Event.find(event_id)

    if event.destroy
      head :ok
    end
  end

  private
    def event_position
      params.require(:event_position).permit(:top, :left)
    end

    def event_id
      params.require(:id).to_i
    end

    def event_params
      params.require(:event).permit(:id, :title, :location, :description, :starts_at, :ends_at, :date, :color_code, :all_day)
    end
end

