class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost(total_cost = 0)
    @activities.each do |activity|
      total_cost += activity.total_cost
    end
    total_cost
  end
end
