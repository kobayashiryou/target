require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "validation check" do
    subject{ tweet.valid? }
    let(:tweet){ build(:tweet, body: body) }
    let(:body){ Faker::Lorem.sentence }
    context "bodyが指定されている時" do
      it "tweetは作成される" do
        expect(subject).to eq true
      end
    end

    context "bodyが指定されていない時" do
      let(:body){ nil }
      it "エラーする" do
        subject
        expect(tweet.errors.messages[:body]).to include "can't be blank"
      end
    end
  end
end
