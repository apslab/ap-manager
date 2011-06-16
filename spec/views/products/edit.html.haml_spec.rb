require 'spec_helper'

describe "products/edit.html.haml" do
  before(:each) do
    @product = assign(:product, stub_model(Product,
      :name => "MyString",
      :observation => "MyText",
      :company_id => 1,
      :tasaiva_id => 1,
      :account_id => 1
    ))
  end

  it "renders the edit product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path(@product), :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_observation", :name => "product[observation]"
      assert_select "input#product_company_id", :name => "product[company_id]"
      assert_select "input#product_tasaiva_id", :name => "product[tasaiva_id]"
      assert_select "input#product_account_id", :name => "product[account_id]"
    end
  end
end
