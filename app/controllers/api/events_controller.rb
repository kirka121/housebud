module Api
  class EventsController < ApiController
    def index
      events = Event.where(["starts_at >= ? AND ends_at <= ?", params[:start], params[:end]])
      render json: events, root: false
    end
  end
end
