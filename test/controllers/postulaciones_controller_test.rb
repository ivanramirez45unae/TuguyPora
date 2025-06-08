require "test_helper"

class PostulacionesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get postulaciones_new_url
    assert_response :success
  end

  test "should get create" do
    get postulaciones_create_url
    assert_response :success
  end
end
