class TodoList < ActiveRecord::Base
  belongs_to :event
  has_many :todo_list_items

end
