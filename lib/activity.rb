class Activity
  attr_reader :name,
              :participants,
              :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = @total||0
    @total = @participants.each_value { |cost| @total_cost += cost }
  end

  def add_participant(name, cost)
    @participants[name] = cost
  end

  def split

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
