class Admin < ApplicationRecord
    acts_as_token_authenticatable
    has_secure_password
    mount_uploader :pdpadmin, PdpadminUploader
end
