class Event < ActiveRecord::Base
  has_many :todo_lists

  validates :title, presence: true, length: { minimum: 1, maximum: 20 }
  validates :description, length: { maximum: 1000 }
  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates :color_code, presence: true
end
