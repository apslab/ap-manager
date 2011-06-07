require 'spec_helper'

describe "refenciacontables/edit.html.haml" do
  before(:each) do
    @refenciacontable = assign(:refenciacontable, stub_model(Refenciacontable,
      :company_id => 1,
      :account_id => 1,
      :referencename => "MyString"
    ))
  end

  it "renders the edit refenciacontable form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => refenciacontables_path(@refenciacontable), :method => "post" do
      assert_select "input#refenciacontable_company_id", :name => "refenciacontable[company_id]"
      assert_select "input#refenciacontable_account_id", :name => "refenciacontable[account_id]"
      assert_select "input#refenciacontable_referencename", :name => "refenciacontable[referencename]"
    end
  end
end
