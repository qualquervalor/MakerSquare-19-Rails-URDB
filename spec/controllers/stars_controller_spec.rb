require 'spec_helper'

describe StarsController do

    describe "GET show" do
    it "assigns the requested star as @star" do
      star = Star.create valid_attributes
      get :show, {:id => star}
      expect(assigns(:star)).to eq(star)
    end
  end

end
