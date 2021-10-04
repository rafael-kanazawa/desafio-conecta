class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  enum role: {employee: 0, admin: 1}

  validates :name,
    format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
    presence: true
  
  validates :email, presence: true

  validates :cpf,
    presence: true,
    length: { is: 11 }

  validate do
    if @not_valid_role
      errors.add(:role, "Invalid user role value")
    end
  end

  def admin?
    self.role == "admin"
  end

  def employee
    self.role == "employee"
  end
 
end
