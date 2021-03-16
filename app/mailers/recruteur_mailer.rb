class RecruteurMailer < ApplicationMailer
    def mdpo(recruteur)
        @recruteur = recruteur

        mail(to: recruteur.email, subject: 'SLM-I : Rappel de mot de passe' )
    end
end
