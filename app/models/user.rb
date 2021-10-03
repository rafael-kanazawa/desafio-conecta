class User < ApplicationRecord
  has_secure_password

  enum role: {employee: 0, admin: 1}

 
end
