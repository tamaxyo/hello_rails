class Blog < ApplicationRecord
  has_many :entries

  validates_presence_of :title
end
