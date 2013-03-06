require 'spec_helper'

describe "elections/show" do
  before(:each) do
    @election = assign(:election, stub_model(Election,
      :name => "Name",
      :game_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
