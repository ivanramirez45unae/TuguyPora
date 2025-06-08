require "test_helper"

class SolicitudesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get solicitudes_index_url
    assert_response :success
  end

  test "should get new" do
    get solicitudes_new_url
    assert_response :success
  end

  test "should get create" do
    get solicitudes_create_url
    assert_response :success
  end
end
