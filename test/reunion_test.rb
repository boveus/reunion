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
end
