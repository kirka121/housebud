class TodoListsController < ApplicationController

  def new
    @list = TodoList.create(title: 'To Do')
  end

  def edit
    @list = TodoList.find(todo_list_id)
  end

  def update
    @list = TodoList.find(todo_list_id)

    if @list.update(todo_list_params)
      @list
    else
      render 'errors', locals: { errors: @list.errors.messages }
    end
  end

  private

    def todo_list_params
      params.require(:todo_list).permit(:title)
    end

    def todo_list_id
      params.require(:id)
    end
end

