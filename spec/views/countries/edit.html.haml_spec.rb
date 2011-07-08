require 'spec_helper'

describe "countries/edit.html.haml" do
  before(:each) do
    @country = assign(:country, stub_model(Country,
      :code => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit country form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => countries_path(@country), :method => "post" do
      assert_select "input#country_code", :name => "country[code]"
      assert_select "input#country_name", :name => "country[name]"
    end
  end
end
