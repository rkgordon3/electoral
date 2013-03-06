require "spec_helper"

describe ElectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/elections").should route_to("elections#index")
    end

    it "routes to #new" do
      get("/elections/new").should route_to("elections#new")
    end

    it "routes to #show" do
      get("/elections/1").should route_to("elections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/elections/1/edit").should route_to("elections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/elections").should route_to("elections#create")
    end

    it "routes to #update" do
      put("/elections/1").should route_to("elections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/elections/1").should route_to("elections#destroy", :id => "1")
    end

  end
end
