require 'spec_helper'

describe ReportsController do

  describe "GET 'monthly'" do
    it "returns http success" do
      get 'monthly'
      response.should be_success
    end
  end

  describe "GET 'yearly'" do
    it "returns http success" do
      get 'yearly'
      response.should be_success
    end
  end

end
