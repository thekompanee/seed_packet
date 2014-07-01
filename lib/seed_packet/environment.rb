module  SeedPacket
class   Environment
  attr_accessor :environment

  def initialize(environment)
    self.environment = environment
  end

  def seeding_allowed?
    environment != 'test'
  end

  def samples_allowed?
    !%w{production test}.include?(environment)
  end
end
end
