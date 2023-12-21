require 'rails_helper'

RSpec.describe ExperimentsController, type: :controller do
  describe "#index" do
    it "assigns @experiments with all experiments" do
      experiment1 = Experiment.create(name: "Experiment 1", disabled: true)
      experiment2 = Experiment.create(name: "Experiment 2", disabled: true)
      experiment3 = Experiment.create(name: "Experiment 3", disabled: false)
      experiment4 = Experiment.create(name: "Experiment 4", disabled: false)
      experiment5 = Experiment.create(name: "Experiment 5", disabled: false)
      experiment6 = Experiment.create(name: "Experiment 6", disabled: false)

      get :index

      expect(assigns(:experiments)).to include(experiment1)
      expect(assigns(:experiments)).to include(experiment2)
      expect(assigns(:experiments)).to include(experiment3)
      expect(assigns(:experiments)).to include(experiment4)
      expect(assigns(:experiments)).to include(experiment5)
      expect(assigns(:experiments)).to include(experiment6)
      expect(assigns(:experiments).count).to eq(Experiment.count)
    end
  end
end