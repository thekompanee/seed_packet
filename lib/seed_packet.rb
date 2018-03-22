# frozen_string_literal: true

require 'pp'
require 'seed_packet/version'
require 'seed_packet/environment'

module SeedPacket
  attr_accessor :environment,
                :factory_class

  def initialize(environment: nil, factory_class: 'FactoryBot')
    self.environment = environment ? Environment.new(environment) : nil

    self.factory_class = Object.const_get(factory_class) if environment.samples_allowed?
  end

  def seed
    yield if environment.seeding_allowed?
  end

  def sample
    yield if environment.samples_allowed?
  end

  def scrub
    yield if environment.scrubbing_allowed?
  end

  private

  # rubocop:disable Metrics/ParameterLists, Style/FormatStringToken
  def sow_seeds(factory,
                display_items: false,
                count:         rand(20),
                traits:        [],
                values:        {},
                message:       '')

    return unless environment.seeding_allowed?

    sample_factory_name = "#{factory}_sample"
    sample_items        = factory_class.create_list(sample_factory_name,
                                                    count,
                                                    *traits,
                                                    values)

    if display_items
      sample_items.each do |item|
        pp item.attributes
        puts
      end
    end

    item_class_name = sample_items.first.class.name
    log_message     = '%4s %s Created %s' % [
                                              count,
                                              item_class_name
                                                .underscore
                                                .titleize
                                                .pluralize,
                                              message,
                                            ]

    print "#{' ' * 256}\r#{log_message}\r"

    sample_items
  end
  # rubocop:enable Metrics/ParameterLists, Style/FormatStringToken
end
