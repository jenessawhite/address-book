require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contacts_url
    assert_response :success
  end

  test "should return contacts" do
    get contacts_url
    assert_equal Contact.all, assigns(:contacts)
  end

  test "should delete contacts" do
    contact = contacts(:one)
    delete contact_url(contact)
    assert_raise(ActiveRecord::RecordNotFound) { contact.reload }
  end
end
