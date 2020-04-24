class ComplexNumber
	attr_accessor :real, :img
	@@state = {"+"=>0, "*"=>0, "bulk_add"=>0, "bulk_multiply"=>0}
	def initialize(real, img)
		@real = real
		@img = img
	end

	def +(cn1)
		@@state["+"] = @@state["+"] +1
		return ComplexNumber.new(@real+cn1.real, @img+cn1.img)
	end

	def *(cn1)
		@@state["*"] = @@state["*"] +1
		return ComplexNumber.new((@real*cn1.real-@img*cn1.img), (@real*cn1.img+@img*cn1.real))
	end

	def to_s()
		return "#{@real}+#{@img}i"
	end

	def self.bulk_add(cns)
		@@state["bulk_add"] = @@state["bulk_add"] +1
		sum = ComplexNumber.new(0,0)
		cns.each do |cn|
			sum = sum + cn
		end
		return sum
	end

	def self.bulk_multiply(cns)
		@@state["bulk_multiply"] = @@state["bulk_multiply"] +1
		mul = ComplexNumber.new(1,0)
		cns.each do |cn|
			mul = mul * cn
		end
		return mul
	end

	def self.get_stats
		return @@state
	end

end

num1 = ComplexNumber.new(3,2)
num2 = ComplexNumber.new(1,7)
Add2nums = num1 + num2
Mul2nums = num1 * num2
AddBulk = ComplexNumber.bulk_add([num1, num2])
MulBulk = ComplexNumber.bulk_multiply([num1, num2])
puts num1.to_s
puts num2.to_s
puts Add2nums.to_s
puts Mul2nums.to_s
puts AddBulk.to_s
puts MulBulk.to_s


puts "state: #{ComplexNumber.get_stats}"
