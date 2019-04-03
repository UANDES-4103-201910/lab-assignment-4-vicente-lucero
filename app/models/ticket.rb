class Ticket < ApplicationRecord

  belongs_to :ticket_type
  belongs_to :order

  before_validation :past_event


  private
    def past_event
      puts("before save")
      idd = self.ticket_type
      idd = idd.id
      ty = TicketType.find(idd)
      ey = Event.find(ty.id)
      if ey.start_date <= Date.today
        false
      end
    end

end
