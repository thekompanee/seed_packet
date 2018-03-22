# frozen_string_literal: true

module  SeedPacket
class   Environment
  attr_accessor :environment

  def initialize(environment)
    self.environment = environment.to_s
  end

  def seeding_allowed?
    environment != 'test'
  end

  def samples_allowed?
    %w{production test}.exclude?(environment)
  end

  def scrubbing_allowed?
    %w{development test}.include?(environment)
  end
end
end
