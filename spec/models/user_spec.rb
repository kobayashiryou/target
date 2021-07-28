require "rails_helper"

RSpec.describe User, type: :model do
  describe "validation check" do
    subject { user.valid? }

    let(:user) { build(:user, username: username, email: email, password: password) }
    let(:username) { Faker::JapaneseMedia::OnePiece.character }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }
    context "username、email、passwordが指定されている時" do
      it "userは作成される" do
        expect(subject).to eq true
      end
    end

    context "usernameがnilの時" do
      let(:username) { nil }
      it "エラーする" do
        subject
        expect(user.errors.messages[:username]).to include "can't be blank"
      end
    end

    context "emailがnilの時" do
      let(:email) { nil }
      it "エラーする" do
        subject
        expect(user.errors.messages[:email]).to include "can't be blank"
      end
    end

    context "passwordがnilの時" do
      let(:password) { nil }
      it "エラーする" do
        subject
        expect(user.errors.messages[:password]).to include "can't be blank"
      end
    end
  end
end
