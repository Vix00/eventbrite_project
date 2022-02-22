class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  after_create :welcome_send

  has_many :administrator_events, foreign_key: 'administrator_id', class_name: "Event", dependent: :destroy
  has_many :presence, dependent: :destroy
  has_many :events, through: :presence

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
