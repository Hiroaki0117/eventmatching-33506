class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_one :address
end
