class Attendance < ApplicationRecord
  after_create :alert_to_admin_send

  belongs_to :participant, class_name: "User"
  belongs_to :event

  validates :stripe_customer_id, uniqueness: true

  def alert_to_admin_send
  UserMailer.alert_to_admin_send(event_id).deliver_now
  end

end
