namespace :seed_packet do
  desc 'Reset the database and load seed data'
  task reset_and_seed: ['db:reset', 'default']

  desc 'Remigrate the database and load seed data'
  task remigrate_and_seed: ['db:migrate:reset', 'default']

  desc 'Provide a base load of randomly generated (but valid) data for development.'
  task default: 'prepare' do
    Rake::Task['seed_packet:seed'].invoke
    Rake::Task['seed_packet:sample'].invoke
  end

  task seed: 'prepare' do
    MyApp::Database::Seed.new(environment: Rails.env).seed
  end

  task sample: 'prepare' do
    MyApp::Database::Sample.new(environment: Rails.env).sample
  end

  task prepare: :environment do
    require File.expand_path('../../../../db/seed.rb',   __FILE__)
    require File.expand_path('../../../../db/sample.rb', __FILE__)
  end
end
