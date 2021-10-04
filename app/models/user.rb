class User < ApplicationRecord
  has_secure_password

  enum role: {employee: 0, admin: 1}

  validates :name, :email,
    format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
    presence: true
  
  validates :cpf,
    format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
    presence: true,
    length: { is: 11 }
 
end
