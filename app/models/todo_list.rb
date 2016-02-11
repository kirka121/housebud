class TodoList < ActiveRecord::Base
  belongs_to :event
  has_many :todo_list_items
  accepts_nested_attributes_for :todo_list_items
end
