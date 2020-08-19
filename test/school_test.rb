require 'minitest/autorun'
require 'minitest/pride'
require './lib/school'

class SchoolTest < Minitest::Test
  #Iteration 1 Tests:
  def test_it_exists
    school = School.new('9:00', 7)

    assert_instance_of School, school
  end

  def test_it_has_start_time
    school = School.new('9:00', 7)

    assert_equal '9:00', school.start_time
  end

  def test_it_has_hours_in_school_day
    school = School.new('9:00', 7)

    assert_equal 7, school.hours_in_school_day
  end

  def test_it_starts_with_no_student_names
    school = School.new('9:00', 7)

    assert_equal [], school.student_names
  end

  #Iteration 2 Tests:
  def test_it_can_add_student_names
    school = School.new('9:00', 7)

    school.add_student_name('Aurora')
    school.add_student_name('tim')
    school.add_student_name('megan')

    assert_equal ['Aurora', 'tim', 'megan'], school.student_names
  end

  def test_it_can_calculate_end_time
    school1 = School.new('9:00', 7)
    school2 = School.new('9:00', 3)

    assert_equal '16:00', school1.end_time
    assert_equal '12:00', school2.end_time
  end

  #Iteration 3 Tests:
  def test_it_is_full_time
    school = School.new('9:00', 7)

    assert school.is_full_time?
  end

  def test_it_can_standardize_student_names
    school = School.new('9:00', 7)

    school.add_student_name('Aurora')
    school.add_student_name('tim')
    school.add_student_name('megan')

    assert_equal ["Aurora", "Tim", "Megan"], school.standard_student_names
  end

  #Iteration 4 Tests:
  def test_it_can_convert_end_time_to_clock_time
    school_1 = School.new('9:00', 7)
    school_2 = School.new('9:00', 3)
    school_3 = School.new('9:00', 2)
    school_4 = School.new('9:00', 12)

    assert_equal "4:00", school_1.convert_end_time_to_clock_time
    assert_equal "12:00", school_2.convert_end_time_to_clock_time
    assert_equal "11:00", school_3.convert_end_time_to_clock_time
    assert_equal "9:00", school_4.convert_end_time_to_clock_time
  end
end
