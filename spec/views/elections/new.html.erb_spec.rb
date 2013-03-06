require 'spec_helper'

describe "elections/new" do
  before(:each) do
    assign(:election, stub_model(Election,
      :name => "MyString",
      :game_id => 1
    ).as_new_record)
  end

  it "renders new election form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => elections_path, :method => "post" do
      assert_select "input#election_name", :name => "election[name]"
      assert_select "input#election_game_id", :name => "election[game_id]"
    end
  end
end
