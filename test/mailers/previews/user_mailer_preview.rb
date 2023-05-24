# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def status_email
    UserMailer.with(parcel: Parcel.first).status_email
  end

  def status_changed
    UserMailer.with(parcel: Parcel.first).status_changed
  end
end
