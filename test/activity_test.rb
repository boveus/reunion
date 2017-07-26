require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def setup
    @activity = Activity.new("Brunch")
  end

  def test_instance_of_activity
    assert_instance_of Activity, @activity
  end

  def test_retrieve_name_of_activity
    assert_equal "Brunch", @activity.name
  end
end



#
# > require './lib/activity'
# # => true
#
# > activity = Activity.new("Brunch")
# # => #<Activity:0x007fe4ca1df568 ...>
#
# > activity.name
# # => "Brunch"
#
# > activity.participants
# # => {}
#
# > activity.add_participant("Jim", 20)
# > activity.participants
# # => {"Jim" => 20}
#
# > activity.total_cost
# # => 20
#
# > activity.add_participant("Joe", 40)
# > activity.participants
# # => {"Jim" => 20, "Joe" => 40}
