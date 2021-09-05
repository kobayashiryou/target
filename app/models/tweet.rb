class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users, dependent: :destroy, through: :likes
  validates :body, presence: true
  mount_uploader :image, TweetUploader
end
