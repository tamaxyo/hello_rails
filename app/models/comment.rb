class Comment < ApplicationRecord
  belongs_to :entry

  def approved?
    return self.status == "approved"
  end
end
