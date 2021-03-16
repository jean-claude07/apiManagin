class Recruteur < ApplicationRecord
    acts_as_token_authenticatable
    has_secure_password
    mount_uploader :pdprecruteur, PdprecruteurUploader
    has_many :info_recruteurs
    has_many :annonces
end
