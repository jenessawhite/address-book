class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def show
    find_contact
  end

  def edit
    find_contact
  end

  def update
    find_contact
    @contact.update(contact_params)

    if @contact.errors.any?
      render json: {errors: @contact.errors.full_messages}, status: 422
    else
      redirect_to contact_path if @contact.save
    end
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.errors.any?
      render json: {errors: @contact.errors.full_messages}, status: 422
    else
      redirect_to contact_path if @contact.save
    end
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
