module Clifford
  class Crypto

    attr_accessor :l, :b, :g, :k

    def initialize(l)
      @l = l
      @b = l/8
      g_10 = Tools.random_number(l)
      k_10 = Tools.random_number(l)
      q_10 = Tools.random_prime(@b + 1)
      @g = Tools.number_to_multivector_mod(g_10,q_10)
      @k = Tools.number_to_multivector_mod(k_10,q_10)
    end

    def encrypt()2
    end

    def decrypt()
    end

  end
end
