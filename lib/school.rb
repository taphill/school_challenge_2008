class School
  attr_reader :start_time, :hours_in_school_day, :student_names

  def initialize(start_time, hours_in_school_day)
    @start_time = start_time
    @hours_in_school_day = hours_in_school_day
    @student_names = []
  end

  def add_student_name(name)
    @student_names << name
  end

  def end_time
    time_array = self.start_time.split(':')
    time_array[0] = (time_array[0].to_i + @hours_in_school_day).to_s

    time_array.join(':')
  end

  def is_full_time?
    if @hours_in_school_day > 4
      true
    else
      false
    end
  end

  def standard_student_names
    @student_names.map do |name|
      name.capitalize
    end
  end

  def convert_end_time_to_clock_time
    clock_time = end_time.to_i - 12 

    if end_time.to_i > 12
      "#{clock_time}:00"
    else
      end_time
    end
  end

end