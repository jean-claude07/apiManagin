class Candidatprofile < ApplicationRecord
    acts_as_token_authenticatable
    has_secure_password
    mount_uploader :pdpcandidat, PdpcandidatUploader
    has_many :plusinfo
    has_many :chauffeurs
end
