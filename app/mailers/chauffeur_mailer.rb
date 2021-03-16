class ChauffeurMailer < ApplicationMailer
    def forgot(candidat)
        @candidatprofile = candidat

        mail(to: candidat.email, subject: 'SLM-I : Recupreration de votre mot de passe' )
    end
end
