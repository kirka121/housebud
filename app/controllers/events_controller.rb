class EventsController < ApplicationController

  def new
    @event = Event.new(starts_at: event_params[:date], ends_at: event_params[:date], color_code: random_color)
  end

  def show
    @event = Event.find(event_id)
  end

  def create
    @event = Event.new(event_params)

    if @event.valid?
      @event.save
      @event = EventSerializer.new(@event, root: false)
    else
      render 'errors', locals: { errors: @event.errors.messages }
    end
  end

  def update
    @event = Event.find(event_id)
    @event.update(event_params)

    if @event.valid?
      @event.save
    else
      render 'errors', locals: { errors: event.errors.messages }
    end
  end

  private

    def event_id
      params.require(:id).to_i
    end

    def event_params
      params.require(:event).permit(:id, :title, :location, :description, :starts_at, :ends_at, :date, :color_code, :all_day)
    end

    def random_color
      colors = [
        '#5d9b93',
        '#815d93',
        '#9e605d',
        '#7a9e5d'
      ]
      colors[rand(0...colors.length)]
    end
end

