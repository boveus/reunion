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

  def test_activity_has_no_participants_by_default
    assert_equal 0, @activity.participants.count
  end

  def test_activity_an_add_participants
    activity_new = Activity.new("Brunch")
    activity_new.add_participant("Jim", 20)
    assert_equal activity_new.participants["Jim"], 20
  end

  def test_total_cost_of_activity
    activity_new = Activity.new("Brunch")
    activity_new.add_participant("Jim", 20)

    assert_equal activity_new.total_cost, 20

    activity_new.add_participant("Joe", 40)

    assert_equal activity_new.total_cost, 60
  end

  def test_activity_split
    activity_new = Activity.new("Brunch")
    activity_new.add_participant("Jim", 20)
    activity_new.add_participant("Joe", 40)

    assert_equal 30, activity_new.split
  end

  def test_activity_owed
    activity_new = Activity.new("Brunch")
    activity_new.add_participant("Jim", 20)
    activity_new.add_participant("Joe", 40)
    owed_hash = {"Jim" => 10, "Joe" => -10}

    assert_equal owed_hash, activity_new.owed

  end

  def test_activity_get_all_participants
    activity_new = Activity.new("Brunch")
    activity_new.add_participant("Jim", 20)
    activity_new.add_participant("Joe", 40)
    activity_new.add_participant("John", 10)

    assert_equal 3, activity_new.get_all_participants.count
  end

end
