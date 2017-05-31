namespace :db do
  task :migrate do
    if Rails.env.development?
      Rake::Task[:erd].invoke
      sh "mv erd.pdf doc/"
      Rake::Task[:annotate_models]
    end
  end
end
