namespace 'db:fixtures' do
  desc "generate fixtures from the current database"

  task :dump => :environment do
    Rails.application.eager_load!
    ActiveRecord::Base.descendants.each do |model|
      puts model.to_s
      next if model.superclass == SqlView
      next if model.abstract_class?
      puts "exporting: #{model}"

      filepath = Rails.root.join('test/fixtures/dump', "#{model.name.underscore}.yml")
      FileUtils.mkdir_p filepath.dirname

      filepath.open('w') do |file|
        hash = {}
        model.all.limit(20).each do |r|
          key = r.try(:name) || "#{filepath.basename('.*')}_#{r.id}"
          hash[key] = r.attributes.except(:password_digest)
        end
        file.write hash.to_yaml
      end
    end
  end
end
