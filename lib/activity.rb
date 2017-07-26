class Activity
  attr_reader :name,
              :participants,
              :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = total_cost
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

  def owed(split_value = split)
    @participants.each do |name, cost|
      @participants[name] = split_value - cost
    end
  end
end
