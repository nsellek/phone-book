class User < ApplicationRecord
  belongs_to :state, optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true

  before_save :normalize_phone

  def normalize_phone
    self.phone = phone.gsub(/\D/, '').last(10)
  end
end
