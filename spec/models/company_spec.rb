require "rails_helper"

RSpec.describe Company, type: :model do
  describe "validation check" do
    subject { company.valid? }

    let(:company) { build(:company, companyname: companyname, email: email, password: password) }
    let(:companyname) { Faker::Company.name }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }
    context "companyname、email、passwordが指定されている時" do
      it "companyは作成される" do
        expect(subject).to eq true
      end
    end

    context "companynameがnilの時" do
      let(:companyname) { nil }
      it "エラーする" do
        subject
        expect(company.errors.messages[:companyname]).to include "can't be blank"
      end
    end

    context "emailがnilの時" do
      let(:email) { nil }
      it "エラーする" do
        subject
        expect(company.errors.messages[:email]).to include "can't be blank"
      end
    end

    context "passwordがnilの時" do
      let(:password) { nil }
      it "エラーする" do
        subject
        expect(company.errors.messages[:password]).to include "can't be blank"
      end
    end
  end
end
