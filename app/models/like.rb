class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :user_id, uniqueness: { case_sensitive: true }, presence: true
  validates :tweet_id, uniqueness: { case_sensitive: true }, presence: true
end
