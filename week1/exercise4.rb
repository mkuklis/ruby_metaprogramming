class A
  @@a = 1
  @a = 2
  a = 3

  @binding = binding
  def self.get_binding
    @binding 
  end
end

p eval('[@@a, @a, a]', A.get_binding)

