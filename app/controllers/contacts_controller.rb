class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all.reorder('id DESC')

    render json: @contacts
  end

  def notif
    @contact = Contact.count

    render json: @contact
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: {contact: @contact, status: :created, location: @contact, message: 'Votre message a été bien envoyer :-)'}
    else
      render json: {invalide: "Tous les champs doit êtres remplie"} 
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.permit(:nom, :email, :subject, :message, :telephone)
    end
end
