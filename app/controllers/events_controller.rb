class EventsController < ApplicationController

  def new
    @event = Event.new()
  end

  def create
    byebug
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

    def calendar_params

    end
end
