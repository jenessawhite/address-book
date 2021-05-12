class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    find_contact
    # @contact = Contact.find_by!(id: params[:id])
  end

  def edit
    find_contact
    # @contact = Contact.find_by!(id: params[:id])
  end

  def update
    find_contact
    # @contact = Contact.find_by!(id: params[:id])
  end

  def new
    @contact = Contact.new(contact_params)
    redirect_to contacts_path(@contact.id) if @contact.save
  end

  private
  def contact_params
    params.require(:contact).permit(
      :id,
      :name,
      :phone_number,
      :email_address,
      :birthday,
      :company
    )
  end

  def find_contact
    @contact = Contact.find_by!(id: params[:id])
  end
end
