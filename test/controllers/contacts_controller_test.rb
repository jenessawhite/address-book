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
end
