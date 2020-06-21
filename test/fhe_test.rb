require Dir.pwd + "/test/test_helper"

class TestFHE< Minitest::Test

  def test_encryption_decryption
    l = 128
    m_10 = 23

    fhe = Clifford::FHE.new l
    c = fhe.encrypt(m_10)

    assert_equal m_10, fhe.decrypt(c)
  end
end
