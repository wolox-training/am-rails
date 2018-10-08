class RentValidationWorker
  include Sidekiq::Worker

  def perform
    rents = Rent.where to_date: Time.zone.today
    rents.find_each do |rent|
      RentMailer.with(rent_id: rent.id).rent_expiry.deliver_later
    end
  end
end
