class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types

  validate :start_date_later_than_today
  before_create :one_event_at_a_time_for_each_venue

  def start_date_later_than_today
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "Start date must be later than today")
    end
  end

  def one_event_at_a_time_for_each_venue
    a = Event.joins(event_venue: :start_date).count
    if a > 1
        errors.add(:event, "There cannot be two or more events hosted in the same venue with the same start date")
     end
  end

end
