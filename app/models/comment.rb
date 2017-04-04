class Comment < ApplicationRecord
  belongs_to :entry

  def approved?
    return self.status == "approved"
  end

  def approve
    self.update_attribute(:status, "approved")
  end
end
