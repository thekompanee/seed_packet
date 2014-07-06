namespace :db do
  desc 'Reset the database and load seed data'
  task reset_and_seed: ['db:reset', 'db:seed']

  desc 'Remigrate the database and load seed data'
  task remigrate_and_seed: ['db:migrate:reset', 'db:seed']

  desc 'Provide a base load of randomly generated (but valid) data for development.'
  task seed: 'prepare' do
    MyApp::Database::Seed.new(environment: Rails.env).seed
    MyApp::Database::Sample.new(environment: Rails.env).sample
  end

  desc 'Scrub data from a production database load'
  task scrub: 'prepare' do
    MyApp::Database::Scrub.new(environment: Rails.env).scrub
  end

  task prepare: :environment do
    require File.expand_path('../../../../db/seed.rb',   __FILE__)
    require File.expand_path('../../../../db/sample.rb', __FILE__)
    require File.expand_path('../../../../db/scrub.rb',  __FILE__)
  end
end
