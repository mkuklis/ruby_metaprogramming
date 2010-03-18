class A
  def initialize
    @a = 11
    @@a = 22
    a = 33
  end
  @a = 1
  @@a = 2
  a = 3
end

p A.instance_eval("@a") # 1
p A.class_eval("@@a") # 2

o = A.new
p o.instance_eval("@a") # 11
p A.class_eval("@@a") # 22
p A.new.send(:initialize) # 33


p A
