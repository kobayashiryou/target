require "rails_helper"

RSpec.describe TodoTargetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/todo_targets").to route_to("todo_targets#index")
    end

    it "routes to #new" do
      expect(get: "/todo_targets/new").to route_to("todo_targets#new")
    end

    it "routes to #show" do
      expect(get: "/todo_targets/1").to route_to("todo_targets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/todo_targets/1/edit").to route_to("todo_targets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/todo_targets").to route_to("todo_targets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/todo_targets/1").to route_to("todo_targets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/todo_targets/1").to route_to("todo_targets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/todo_targets/1").to route_to("todo_targets#destroy", id: "1")
    end
  end
end
