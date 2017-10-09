namespace :db do
  task :migrate do
    if Rails.env.development?
      #Rake::Task[:erd].invoke
      #sh "mv erd.pdf doc/"
    end
  end
end
