namespace :db do
  task :migrate do
    Rake::Task[:erd].invoke
    sh "mv erd.pdf doc/"
  end
end
