class User < ApplicationRecord
  has_many  :hostings, class_name: "Event", foreign_key: "creator_id"
  has_many  :attendences, foreign_key: "attendee"
  has_many  :attended_events, through: :attendences

  def upcoming_events
    self.attended_events.where("event_date >= :today", { today: Time.zone.now })
  end

  def previous_events
    self.attended_events.where("event_date < :today", { today: Time.zone.now })
  end

  validates :username, presence: true, uniqueness: true
end
