require "rails_helper"

RSpec.describe TodoTarget, type: :model do
  describe "validation check" do
    subject{ todo_target.valid? }
    let(:todo_target){ build(:todo_target, body: body) }
    let(:body){ Faker::Lorem.sentence }
    context "bodyが指定されている時" do
      it "todo_targetは作成される" do
        expect(subject).to eq true
      end
    end

    context "bodyがnilの時" do
      let(:body){ nil }
      it "エラーする" do
        subject
        expect(todo_target.errors.messages[:body]).to include "can't be blank"
      end
    end
  end
end
