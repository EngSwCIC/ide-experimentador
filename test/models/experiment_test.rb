require "test_helper"

class ExperimentTest < ActiveSupport::TestCase
  
  describe "Stop experiment" do
    it "stops an experiment" do
      visit experiments_path
      click_button "Stop"
      expect(experiment.status).to eq("stopped")
    end
  end

  describe "Start experiment" do
    it "starts an experiment" do
      visit experiments_path
      click_button "Start"
      expect(experiment.status).to eq("running")
    end
  end  
  
  test "should stop experiment" do
    experiment = experiments(:one)
    experiment.stop
    assert_equal experiment.status, "stopped"
  end

  test "should start experiment" do
    experiment = experiments(:one)
    experiment.start
    assert_equal experiment.status, "running"
  end

end
