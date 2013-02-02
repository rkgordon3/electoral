require 'spec_helper'

describe GameSessionControllerController do

  describe "GET 'roll'" do
    it "returns http success" do
      get 'roll'
      response.should be_success
    end
  end

end
