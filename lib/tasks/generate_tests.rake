desc 'Generate MiniTest stubs for existing models'
task :regen => :environment do
  puts '...generating model and controller tests'
  ActiveRecord::Base.descendants.each do |model|
    puts model.to_s
    fields = ''
    model.attribute_names.each do |k|
      unless ["id","created_at","updated_at"].include?(k)
        fields <<  "#{k}:#{model.type_for_attribute(k).type} "
      end
    end
    `rails generate test_unit:scaffold #{model.to_s} #{fields}`
    `rails generate test_unit:model #{model.to_s} #{fields}`
  end
  ActiveJob::Base.descendants.each do |job|
    puts job.to_s
    `rails generate test_unit:job #{job.to_s}`
  end
  puts 'end'
  ActionMailer::Base.descendants.each do |mailer|
    puts mailer.to_s
    `rails generate test_unit:mailer #{mailer.to_s}`
  end
end
