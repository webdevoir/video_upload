require 'test_helper'

class UploadFormControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get upload_form_index_url
    assert_response :success
  end

end
