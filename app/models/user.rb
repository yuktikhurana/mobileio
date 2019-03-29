class User < ApplicationRecord

  attr_accessor :mobile

  before_create :encryt_mobile

  def mobile_decrypted
    ENCRYPTOR.decrypt_and_verify(encrypted_mobile)
  end

  private

    def encryt_mobile
      self.encrypted_mobile = ENCRYPTOR.encrypt_and_sign(mobile)
    end

end
