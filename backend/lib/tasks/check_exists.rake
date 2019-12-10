namespace :db do
  desc "Check exists DB"
  task :check_exists do
    begin
      Rake::Task['environment'].invoke
      ActiveRecord::Base.connection
    rescue ActiveRecord::NoDatabaseError
      true
    else
      false
    end
  end
end
