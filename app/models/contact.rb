class Contact < ApplicationRecord
    validates_presence_of :subject, {message: "ne doit pas êtres vide :-)"}
end
