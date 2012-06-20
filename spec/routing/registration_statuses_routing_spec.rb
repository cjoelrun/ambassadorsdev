require "spec_helper"

describe RegistrationStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/registration_statuses").should route_to("registration_statuses#index")
    end

    it "routes to #new" do
      get("/registration_statuses/new").should route_to("registration_statuses#new")
    end

    it "routes to #show" do
      get("/registration_statuses/1").should route_to("registration_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/registration_statuses/1/edit").should route_to("registration_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/registration_statuses").should route_to("registration_statuses#create")
    end

    it "routes to #update" do
      put("/registration_statuses/1").should route_to("registration_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/registration_statuses/1").should route_to("registration_statuses#destroy", :id => "1")
    end

  end
end
