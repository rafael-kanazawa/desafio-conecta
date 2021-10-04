class User < ApplicationRecord
  has_secure_password
  USER_ROLES = {employee: 0, admin: 1} 
  enum role: USER_ROLES

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

  def role=(value)
    value = value.to_s
    unless USER_ROLES.includes?(value.to_sym)
      @not_valid_role = true
    else
      value
    end
  end
 
end
