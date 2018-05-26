class Event < ApplicationRecord
  belongs_to :creator ,    class_name: "User"
  has_many   :attendences, foreign_key: "attended_event"
  has_many   :attendees, through: :attendences, source: "attendee"

  scope :past,     -> { where("event_date < :today", {today: Time.zone.now}) }
  scope :upcoming, -> { where("event_date >= :today",{today: Time.zone.now}) }
  
  validates  :description, presence: true
  validates  :location,    presence: true
  validates  :event_date,  presence: true
end
