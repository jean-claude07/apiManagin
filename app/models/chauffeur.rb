class Chauffeur < ApplicationRecord
    mount_uploader :photo, PhotoUploader
    mount_uploader :permis, PermisUploader
    mount_uploader :cv, CvUploader
    belongs_to :candidatprofile
end
