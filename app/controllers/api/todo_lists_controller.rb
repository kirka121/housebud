module Api
  class TodoListsController < ApiController
    def index
      events = Event.where(["starts_at >= ? AND ends_at <= ?", params[:start], params[:end]])
      render json: events, root: false
    end

    def destroy
      event = Event.find(event_id)

      if event.destroy
        render json: event, root: false
      end
    end

    private

      def event_id
        params.require(:id).to_i
      end
  end
end
