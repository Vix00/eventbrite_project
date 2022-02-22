class Presence < ApplicationRecord
  belongs_to :event
  belongs_to :user
end