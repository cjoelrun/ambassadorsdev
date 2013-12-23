require "spec_helper"

describe DeadlinesController do
  describe "routing" do

    it "routes to #index" do
      get("/deadlines").should route_to("deadlines#index")
    end

    it "routes to #new" do
      get("/deadlines/new").should route_to("deadlines#new")
    end

    it "routes to #show" do
      get("/deadlines/1").should route_to("deadlines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/deadlines/1/edit").should route_to("deadlines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/deadlines").should route_to("deadlines#create")
    end

    it "routes to #update" do
      put("/deadlines/1").should route_to("deadlines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/deadlines/1").should route_to("deadlines#destroy", :id => "1")
    end

  end
end
