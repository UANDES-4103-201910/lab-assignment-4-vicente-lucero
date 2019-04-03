class User < ApplicationRecord
  has_many :orders

  validates :email, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "only allows valid email format"}
  validates :phone, length: {in: 9..12}
  validates :password, format: {with: /\A[a-zA-Z0-9_\-]+\z/}

end
