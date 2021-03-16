class Questiondebutant < ApplicationRecord
    has_many :choixquestiondebutants
    has_one :reponsequestiondebutant
end
