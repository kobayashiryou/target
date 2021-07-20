require "rails_helper"

RSpec.describe Todo, type: :model do
  describe "validation check" do
    subject { todo.valid? }

    let(:todo) { build(:todo, body: body) }
    let(:body) { Faker::Lorem.sentence }

    context "bodyが指定されている時" do
      it "todoは作成される" do
        expect(subject).to eq true
      end
    end

    context "bodyが指定されていない時" do
      let(:body) { nil }
      it "エラーする" do
        subject
        expect(todo.errors.messages[:body]).to include "can't be blank"
      end
    end
  end
end
