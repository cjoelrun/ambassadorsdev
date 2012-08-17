require "spec_helper"

describe YearsController do
  describe "routing" do

    it "routes to #index" do
      get("/years").should route_to("years#index")
    end

    it "routes to #new" do
      get("/years/new").should route_to("years#new")
    end

    it "routes to #show" do
      get("/years/1").should route_to("years#show", :id => "1")
    end

    it "routes to #edit" do
      get("/years/1/edit").should route_to("years#edit", :id => "1")
    end

    it "routes to #create" do
      post("/years").should route_to("years#create")
    end

    it "routes to #update" do
      put("/years/1").should route_to("years#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/years/1").should route_to("years#destroy", :id => "1")
    end

  end
end
