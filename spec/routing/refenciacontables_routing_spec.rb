require "spec_helper"

describe RefenciacontablesController do
  describe "routing" do

    it "routes to #index" do
      get("/refenciacontables").should route_to("refenciacontables#index")
    end

    it "routes to #new" do
      get("/refenciacontables/new").should route_to("refenciacontables#new")
    end

    it "routes to #show" do
      get("/refenciacontables/1").should route_to("refenciacontables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/refenciacontables/1/edit").should route_to("refenciacontables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/refenciacontables").should route_to("refenciacontables#create")
    end

    it "routes to #update" do
      put("/refenciacontables/1").should route_to("refenciacontables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/refenciacontables/1").should route_to("refenciacontables#destroy", :id => "1")
    end

  end
end
