class Tweet < ApplicationRecord
  belongs_to :user
  has_many :users, dependent: :destroy, through: :likes
  has_many :likes, dependent: :destroy
  validates :body, presence: true
  mount_uploader :image, TweetUploader
end
