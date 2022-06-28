class Robot
  @@used_names = []

  attr_reader :name

  def initialize
    assign_name
  end

  def reset
    @@used_names.delete(name)
    assign_name
  end

  private

  def assign_name
    @name = generate_name
    @@used_names << name
  end

  def generate_name
    result = nil
    loop do
      result = ''
      2.times { result << ('A'..'Z').to_a.sample }
      3.times { result << ('0'..'9').to_a.sample }
      break unless @@used_names.include?(result)
    end
    result
  end
end


# class Robot
#   @@used_names = []

#   def name
#     return @name if @name
#     @name = generate_name while @@used_names.include?(@name) || @name.nil?
#     @@used_names << @name
#     @name
#   end

#   def generate_name
#     result = ''
#     2.times { result << ('A'..'Z').to_a.sample }
#     3.times { result << ('0'..'9').to_a.sample }
#     result
#   end

#   def reset
#     @@used_names.delete(@name)
#     @name = nil
#   end
# end

