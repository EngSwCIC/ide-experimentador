require 'rails_helper'

RSpec.describe Experiment, type: :model do
  it "is valid with valid attributes" do
    experiment = Experiment.new(name: "Experiment1", disabled: false)
    expect(experiment).to be_valid
  end
  it "is not valid without a name" do
    experiment = Experiment.new(name: nil, disabled: false)
    expect(experiment).to_not be_valid
  end
  it "is not valid without a disabled" do
    experiment = Experiment.new(name: "Experiment1", disabled: nil)
    expect(experiment).to_not be_valid
  end
end
