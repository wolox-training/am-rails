class MailWorker
  include Sidekiq::Worker

  def perform(rent_id)
    RentMailer.with(rent: rent_id).rent_confirmation.deliver_now
  end
end
