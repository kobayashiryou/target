require "rails_helper"

RSpec.describe Department, type: :model do
  describe "validation check" do
    subject { department.valid? }

    let(:department) { build(:department, departmentname: departmentname, email: email, password: password) }
    let(:departmentname) { Faker::Company.industry }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }
    context "departmentname、email、passwordが指定されている時" do
      it "departmentは作成される" do
        expect(subject).to eq true
      end
    end

    context "departmentnameがnilの時" do
      let(:departmentname) { nil }
      it "エラーする" do
        subject
        expect(department.errors.messages[:departmentname]).to include "can't be blank"
      end
    end

    context "emailがnilの時" do
      let(:email) { nil }
      it "エラーする" do
        subject
        expect(department.errors.messages[:email]).to include "can't be blank"
      end
    end

    context "passwordがnilの時" do
      let(:password) { nil }
      it "エラーする" do
        subject
        expect(department.errors.messages[:password]).to include "can't be blank"
      end
    end
  end
end
