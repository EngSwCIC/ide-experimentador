require 'rails_helper'

RSpec.describe "simulators/index.html.erb", type: :view do
  before(:each) do
    assign(:simulators, [
      Simulator.create!(
        :name => "Simulator1",
        :disabled => false
      ),
      Simulator.create!(
        :name => "Simulator2",
        :disabled => false
      )
    ])
  end

  it "renders a list of simulators" do
    render
    assert_select "tr>td", :text => "Simulator1".to_s, :count => 1
    assert_select "tr>td", :text => "Simulator2".to_s, :count => 1
  end
end
