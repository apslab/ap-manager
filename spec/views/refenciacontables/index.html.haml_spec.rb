require 'spec_helper'

describe "refenciacontables/index.html.haml" do
  before(:each) do
    assign(:refenciacontables, [
      stub_model(Refenciacontable,
        :company_id => 1,
        :account_id => 1,
        :referencename => "Referencename"
      ),
      stub_model(Refenciacontable,
        :company_id => 1,
        :account_id => 1,
        :referencename => "Referencename"
      )
    ])
  end

  it "renders a list of refenciacontables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Referencename".to_s, :count => 2
  end
end
