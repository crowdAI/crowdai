namespace :db do
  task :migrate do
    unless Rails.env.production?
      Rake::Task[:erd].invoke
      sh "mv erd.pdf doc/"
      Rake::Task[:annotate_models]
    end
  end
end
