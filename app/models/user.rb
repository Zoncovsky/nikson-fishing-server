class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  validates :full_name, :phone_number, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, phone: true
  validate :password_complexity

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email encrypted_password full_name id id_value phone_number remember_created_at reset_password_sent_at reset_password_token updated_at]
  end

  private

  def password_complexity
    unless password =~ /\A(?=.*[A-Z])(?=\S+$).{6,}\z/
      errors.add(:password, :invalid_format)
    end
  end
end
