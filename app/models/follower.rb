class Follower < ApplicationRecord
  # belongs_to :accounts
  validates_presence_of :following_id
  validates_uniqueness_of :follower_id, scope: :following_id

end
