require "spec_helper"

describe CreditTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/credit_types").should route_to("credit_types#index")
    end

    it "routes to #new" do
      get("/credit_types/new").should route_to("credit_types#new")
    end

    it "routes to #show" do
      get("/credit_types/1").should route_to("credit_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/credit_types/1/edit").should route_to("credit_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/credit_types").should route_to("credit_types#create")
    end

    it "routes to #update" do
      put("/credit_types/1").should route_to("credit_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/credit_types/1").should route_to("credit_types#destroy", :id => "1")
    end

  end
end
