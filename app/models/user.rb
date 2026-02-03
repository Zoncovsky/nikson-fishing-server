class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable, omniauth_providers: %i[google_oauth2]


  after_create :password_complexity

  validates :first_name, :last_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :orders
  has_many :order_products, through: :orders

  def self.ransackable_attributes(auth_object = nil)
    %w[created_at email encrypted_password first_name last_name id id_value phone_number remember_created_at reset_password_sent_at reset_password_token updated_at]
  end

  def full_name
    "#{first_name} #{last_name}".titleize
  end

  def self.from_omniauth(access_token)
    user = User.where(email: access_token.info.email).first

    unless user
      user = User.create(first_name: access_token.info.first_name,
                         last_name: access_token.info.last_name,
                         email: access_token.info.email,
                         password: Devise.friendly_token[0, 20])
    end
    user.first_name = access_token.info.name
    user.uid = access_token.uid
    user.provider = access_token.provider
    user.save

    user
  end

  private

  def password_complexity
    unless password =~ /\A(?=.*[A-Z])(?=\S+$).{6,}\z/
      errors.add(:password, :invalid_format)
    end
  end
end
