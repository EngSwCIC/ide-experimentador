# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Experiment.destroy_all

xp1 = Experiment.create!(
    [{
        "name": "exp01",
        "disabled": false
    },{
        "name": "exp02",
        "disabled": true
    },
    {
        "name": "exp03",
        "disabled": false
    },

]
)

p "Created #{Experiment.count} experiments"

Trial.destroy_all

trial1 = Trial.create!(
    {   
        "name": "Teste 1",
        "disabled": false,
        "deleted": false,
        "runs": 0,
        "experiment": xp1[0]
    }
)

trial2 = Trial.create!(
    {   
        "name": "Teste 2",
        "disabled": false,
        "deleted": false,
        "runs": 0,
        "experiment": xp1[0]
    }
)

trial3 = Trial.create!(
    {   
        "name": "Teste 3",
        "disabled": false,
        "deleted": false,
        "runs": 0,
        "experiment": xp1[0]
    }
)

trial4 = Trial.create!(
    {   
        "name": "Teste 4",
        "disabled": false,
        "deleted": false,
        "runs": 0,
        "experiment": xp1[0]
    }
)


trial5 = Trial.create!(
    {   
        "name": "Teste 5",
        "disabled": false,
        "deleted": false,
        "runs": 0,
        "experiment": xp1[0]
    }
)
p "Created #{Trial.count} trials"


TrialExecution.destroy_all

# toRun (verde), incompleted(amarela), running(outroicone)

TrialExecution.create!(
{
    "status": "toRun",
    "log": '{"x":"0", "y":"0", "z":"0", "battery":"0%"}',
    "trial": trial1
})

TrialExecution.create!(
{
    "status": "running",
    "log": '{"x":"0", "y":"0", "z":"0", "battery":"0%"}',
    "trial": trial2
})


TrialExecution.create!(
{
    "status": "incompleted",
    "log": '{"x":"0", "y":"0", "z":"0", "battery":"0%"}',
    "trial": trial3
})

TrialExecution.create!(
{
    "status": "toRun",
    "log": '{"x":"0", "y":"0", "z":"0", "battery":"0%"}',
    "trial": trial4
})

TrialExecution.create!(
{
    "status": "toRun",
    "log": '{"x":"0", "y":"0", "z":"0", "battery":"0%"}',
    "trial": trial5
})
p "Created #{TrialExecution.count} trialExecution"
