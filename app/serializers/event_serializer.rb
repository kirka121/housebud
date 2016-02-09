class EventSerializer < ActiveModel::Serializer
  attributes  :id, :title, :allDay, :start, :end, :color

  def allDay
    object.all_day
  end

  def start
    object.starts_at.iso8601
  end

  def end
    object.ends_at.iso8601
  end

  def color
    object.color_code
  end
end
