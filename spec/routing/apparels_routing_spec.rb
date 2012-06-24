require "spec_helper"

describe ApparelsController do
  describe "routing" do

    it "routes to #index" do
      get("/apparels").should route_to("apparels#index")
    end

    it "routes to #new" do
      get("/apparels/new").should route_to("apparels#new")
    end

    it "routes to #show" do
      get("/apparels/1").should route_to("apparels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/apparels/1/edit").should route_to("apparels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/apparels").should route_to("apparels#create")
    end

    it "routes to #update" do
      put("/apparels/1").should route_to("apparels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/apparels/1").should route_to("apparels#destroy", :id => "1")
    end

  end
end
