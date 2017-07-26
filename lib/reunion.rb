class Reunion
  attr_reader :name,
              :activities

  def initialize(name)
    @name = name
    @activities = []
    @participants = []
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

  def get_all_participants(all_participants = [])
    @activities.each do |activity|
      activity.get_all_participants.each do |participant|
        all_participants << participant
      end
    end
    @participants = all_participants.uniq
  end
end
