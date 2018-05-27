class Event < ApplicationRecord
  belongs_to :creator ,    class_name: "User"
  has_many   :attendances, foreign_key: "attended_event"
  has_many   :attendees, through: :attendances, source: "attendee"

  scope :past,     -> { where("event_date <  :today", {today: Time.zone.now}) }
  scope :upcoming, -> { where("event_date >= :today", {today: Time.zone.now}) }

  validates  :description, presence: true
  validates  :location,    presence: true
  validates  :event_date,  presence: true
end
