require "rails_helper"

RSpec.describe DigitizationAgsksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/digitization_agsks").to route_to("digitization_agsks#index")
    end

    it "routes to #new" do
      expect(get: "/digitization_agsks/new").to route_to("digitization_agsks#new")
    end

    it "routes to #show" do
      expect(get: "/digitization_agsks/1").to route_to("digitization_agsks#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/digitization_agsks/1/edit").to route_to("digitization_agsks#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/digitization_agsks").to route_to("digitization_agsks#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/digitization_agsks/1").to route_to("digitization_agsks#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/digitization_agsks/1").to route_to("digitization_agsks#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/digitization_agsks/1").to route_to("digitization_agsks#destroy", id: "1")
    end
  end
end
