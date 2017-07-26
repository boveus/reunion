class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def total_cost(total = 0)
    @participants.each_value do |cost|
      total += cost
    end
    total
  end

  def split
    total_cost / 2
  end
end
