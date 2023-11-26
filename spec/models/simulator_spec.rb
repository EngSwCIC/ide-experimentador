require 'rails_helper'

RSpec.describe Simulator, type: :model do
  it "is valid with valid attributes" do
    simulator = Simulator.new(name: "Simulator1", disabled: false)
    expect(simulator).to be_valid
  end
  it "is not valid without a name" do
    simulator = Simulator.new(name: nil, disabled: false)
    expect(simulator).to_not be_valid
  end
  it "is not valid without a disabled" do
    simulator = Simulator.new(name: "Simulator1", disabled: nil)
    expect(simulator).to_not be_valid
  end
end
