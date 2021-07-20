require "rails_helper"

RSpec.describe DepartmentTargetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/department_targets").to route_to("department_targets#index")
    end

    it "routes to #new" do
      expect(get: "/department_targets/new").to route_to("department_targets#new")
    end

    it "routes to #show" do
      expect(get: "/department_targets/1").to route_to("department_targets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/department_targets/1/edit").to route_to("department_targets#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/department_targets").to route_to("department_targets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/department_targets/1").to route_to("department_targets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/department_targets/1").to route_to("department_targets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/department_targets/1").to route_to("department_targets#destroy", id: "1")
    end
  end
end
