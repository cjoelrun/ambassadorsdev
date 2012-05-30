require 'digest/md5'

module Devise
  module Encryptable
    module Encryptors
      class Md5 < Base

        def self.digest(password, stretches, salt, pepper)
          str = [password].flatten.compact.join
          Digest::MD5.hexdigest(str)
        end

        def self.salt(username)
          nil
        end

      end
    end
  end
end
