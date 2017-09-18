require 'test_helper'

class SolicitudControllerTest < ActionDispatch::IntegrationTest
  test "should get espera" do
    get solicitud_espera_url
    assert_response :success
  end

end
