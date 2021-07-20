require "rails_helper"

RSpec.describe DepartmentTarget, type: :model do
  describe "正常系テスト" do
    subject{ department_target.valid? }
    let(:department_target){ build(:department_target, monthly_target: monthly_target, anually_target: anually_target) }
    let(:monthly_target){ Faker::Lorem.sentence }
    let(:anually_target){ Faker::Lorem.sentence }
    context "monthly_target,anually_targetが指定されている時" do
      it "monthly_target,anually_targetが作成される" do
        expect(subject).to eq true
      end
    end

    context "monthly_targetのみが指定されている時" do
      let(:anually_target){ nil }
      it "monthly_targetが作成される" do
        expect(subject).to eq true
      end
    end

    context "anually_targetのみが指定されてる時" do
      let(:monthly_target){ nil }
      it "anually_targetが作成される" do
        expect(subject).to eq true
      end
    end
  end
end
