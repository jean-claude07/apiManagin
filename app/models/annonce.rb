class Annonce < ApplicationRecord
    mount_uploader :annoncephoto, AnnoncephotoUploader
    belongs_to :recruteur
end
