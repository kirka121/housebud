module Api
  class EventsController < ApiController
    def index
      render json: Event.all, root: false
    end

    private

  end
end
