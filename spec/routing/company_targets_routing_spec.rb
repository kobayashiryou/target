require "rails_helper"

RSpec.describe CompanyTargetsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/company_targets").to route_to("company_targets#index")
    end

    it "routes to #new" do
      expect(get: "/company_targets/new").to route_to("company_targets#new")
    end

    it "routes to #show" do
      expect(get: "/company_targets/1").to route_to("company_targets#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/company_targets/1/edit").to route_to("company_targets#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/company_targets").to route_to("company_targets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/company_targets/1").to route_to("company_targets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/company_targets/1").to route_to("company_targets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/company_targets/1").to route_to("company_targets#destroy", id: "1")
    end
  end
end
