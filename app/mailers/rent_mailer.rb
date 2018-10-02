class RentMailer < ApplicationMailer
  layout 'layouts/rent_mailer'

  def rent_confirmation
    rent_id = params[:rent_id]
    @rent = Rent.find(rent_id)
    @user = @rent.user
    @book = @rent.book

    I18n.locale = @user.locale || I18n.default_locale

    mail(to: @user.email, subject: 'Rent Confirmation Email')
  end
end
