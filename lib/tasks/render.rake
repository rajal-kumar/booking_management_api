namespace :render do
  desc "Set up database on Render"
  task setup: :environment do
    Rake::Task['db:setup'].invoke
  end
end
