require 'pp'
require 'seed_packet/version'
require 'seed_packet/environment'

module SeedPacket
  attr_accessor :environment,
                :factory_class

  def initialize(options = {})
    self.environment   = options.key?(:environment) ? Environment.new(environment) : nil

    if environment.samples_allowed?
      self.factory_class = Object.const_get(options.fetch(:factory_class, 'FactoryGirl'))
    end
  end

  def seed
    if environment.seeding_allowed?
      yield
    end
  end

  def sample
    if environment.samples_allowed?
      yield
    end
  end

  def scrub
    if environment.scrubbing_allowed?
      yield
    end
  end

  private

  def sow_seeds(factory, options = {})
    if environment.seeding_allowed?
      display_items       = options.fetch(:display_items, false)
      count               = options.fetch(:count,         rand(20))
      overridden_values   = options.fetch(:values,        {})
      additional_message  = options.fetch(:message,       '')

      sample_factory_name = "#{factory}_sample"
      sample_items        = factory_class.create_list(sample_factory_name,
                                                      count,
                                                      overridden_values)

      if display_items
        sample_items.each do |item|
          pp item.attributes
          puts
        end
      end

      item_class_name = sample_items.first.class.name
      log_message = "%4s %s Created %s" % [count, item_class_name.underscore.titleize.pluralize, additional_message]

      puts "#{' ' * 256}\r#{log_message}\r"

      sample_items
    end
  end
end
