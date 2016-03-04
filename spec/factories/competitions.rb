FactoryGirl.define do
  factory :competition do
    hosting_institution nil { create :hosting_institution }
    competition "The Second Annual Data Science Bowl"
    start_date "2016-03-01"
    end_date "2016-03-31"
    status_cd "draft"
    description "We all have a heart. Although we often take it for granted, it's our heart that gives us the moments in life to imagine, create, and discover. Yet cardiovascular disease threatens to take away these moments. Each day, 1,500 people in the U.S. alone are diagnosed with heart failure—but together, we can help. We can use data science to transform how we diagnose heart disease. "
    evaluation "Submissions will be evaluated on the Continuous Ranked Probability Score (CRPS). For each MRI, you must predict a cumulative probability distribution for both the systolic and diastolic volumes (two separate distributions per case)."
    evaluation_criteria "MyText"
    rules "MyText"
    prizes "MyText"
    resources "MyText"
  end
end
