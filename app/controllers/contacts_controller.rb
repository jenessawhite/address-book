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

  def new
    @contact = Contact.new()
    Rails.logger.debug(@contact.inspect)
    @contact.email_labels.build.build_email
    Rails.logger.debug(@contact.email_labels.first.email.inspect)
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
    @contact = Contact.create(contact_params)

    if @contact.errors.any?
      render json: {errors: @contact.errors.full_messages}, status: 422
    else
      redirect_to contact_path(@contact)
    end
  end

  def destroy
    find_contact
    @contact.destroy

    if @contact.errors.any?
      render json: {errors: @contact.errors.full_messages}, status: 422
    else
      redirect_to root_path
    end
  end

  private
  def contact_params
    params.require(:contact).permit!
  end

  def find_contact
    @contact = Contact.find_by!(id: params[:id])
  end
end
