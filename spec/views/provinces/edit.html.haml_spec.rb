require 'spec_helper'

describe "provinces/edit.html.haml" do
  before(:each) do
    @province = assign(:province, stub_model(Province,
      :code => "MyString",
      :name => "MyString",
      :country_id => 1
    ))
  end

  it "renders the edit province form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => provinces_path(@province), :method => "post" do
      assert_select "input#province_code", :name => "province[code]"
      assert_select "input#province_name", :name => "province[name]"
      assert_select "input#province_country_id", :name => "province[country_id]"
    end
  end
end
