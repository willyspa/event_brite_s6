class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  before_save {  |user| user.email = email.downcase }
  after_create :welcome_send

  validates :first_name,
    presence: true
  validates :last_name,
    presence: true
  validates :description,
    presence: true

  has_many :attendances
  has_many :events, through: :attendances

  has_many :create_events, foreign_key: 'admin_event_id', class_name: "Event"
  has_many :participate_events, foreign_key: 'participant_id', class_name: "Event"

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
