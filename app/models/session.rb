class Session < ApplicationRecord
  belongs_to :user

  def close
   self.update(active: false, exit_at: DateTime.now)
  end

  def expired?
    self.expiry_at <= DateTime.now
  end

  def active?
    self.close if self.expired?
    return self.active
  end

  def refresh
    self.update(expiry_at: DateTime.now + 2.hours + 30.minutes)
  end
end
