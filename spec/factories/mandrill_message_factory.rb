
FactoryGirl.define do
  factory :mandrill_message, class: MandrillMessage do
    res [{"email"=>"micah@satterfieldzulauf.name",
          "status"=>"sent",
          "_id"=>"f803abf3d50748029a99fd21e52ddb97",
          "reject_reason"=>nil}]
    message {
              {:subject=>"New discussion comment",
               :from_name=>"crowdAI",
               :from_email=>"no-reply@crowdai.org",
               :to=>[{:email=>"micah@satterfieldzulauf.name", :type=>"to"}],
               :global_merge_vars=>[
                 {:name=>"NAME", :content=>"participant_1456@example.com"},
                 {:name=>"BODY", :content=>"<div><p>A new comment has been made</p></div>"}
               ]
             }
           }
    meta nil
  end
end
