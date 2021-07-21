class EmailsController < ApplicationController
  def new
    @contact = Contact.find_by!(id: params[:contact_id])
    @email = @contact.emails.build
  end

  def edit
    @contact = Contact.find_by!(id: params[:contact_id])
    @email = @contact.emails.find_by!(id: params[:id])
  end

  def create
    @contact = Contact.find_by!(id: params[:contact_id])
    @email = @contact.emails.create(email_params)

    if @email.errors.any?
      render json: {errors: @email.errors.full_messages}, status: 422
    else
      redirect_to contact_path(params[:contact_id]) if @email.save
    end
  end

  def update
    @contact = Contact.find_by!(id: params[:contact_id])
    @email = @contact.emails.find_by!(id: params[:id])
    @email.update(email_params)

    if @email.errors.any?
      render json: {errors: @email.errors.full_messages}, status: 422
    else
      redirect_to contact_path(params[:contact_id]) if @email.save
    end
  end

  private
  def email_params
    params.require(:email).permit(
      :address,
      :id
    )
  end
end