require 'spec_helper'

describe "refenciacontables/show.html.haml" do
  before(:each) do
    @refenciacontable = assign(:refenciacontable, stub_model(Refenciacontable,
      :company_id => 1,
      :account_id => 1,
      :referencename => "Referencename"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Referencename/)
  end
end
