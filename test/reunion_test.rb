require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'
require './lib/activity'

class ReunionTest < Minitest::Test
  def setup
    @reunion = Reunion.new("Denver")
  end

  def test_it_exists
    assert_instance_of Reunion, @reunion
  end

  def test_reunion_name
    assert_equal "Denver", @reunion.name
  end

  def test_reunion_activities_start_empty
    assert_equal 0, @reunion.activities.count
  end

  def test_add_activity
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    @reunion.add_activity(activity_1)

    assert_instance_of Activity, @reunion.activities[0]
  end

  def test_reunion_total_cost
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    @reunion.add_activity(activity_1)

    assert_equal 60, @reunion.total_cost

    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    @reunion.add_activity(activity_2)
    assert_equal 200, @reunion.total_cost
  end

  def test_return_all_participants
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    @reunion.add_activity(activity_1)
    @reunion.add_activity(activity_2)

    assert_equal 3, @reunion.get_all_participants.count

  end

  def test_reunion_breakout
    skip
    activity_1 = Activity.new("Brunch")
    activity_1.add_participant("Jim", 20)
    activity_1.add_participant("Joe", 40)
    @reunion.add_activity(activity_1)
    activity_2 = Activity.new("Drinks")
    activity_2.add_participant("Jim", 60)
    activity_2.add_participant("John", 80)
    @reunion.add_activity(activity_2)
    breakout_hash = {"Jim"=> 20, "Joe"=> -10, "John"=> -10}


    assert_equal breakout_hash, @reunion.breakout
  end
end


# > reunion.breakout
# # => {"Jim"=> 20, "Joe"=> -10, "John"=> -10}
#
# > reunion.print_summary
# Jim: 20
# Joe: -10
# John: -10
