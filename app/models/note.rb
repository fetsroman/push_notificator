class Note < ApplicationRecord
  belongs_to :user

  validates_presence_of :text, :push_time
end
