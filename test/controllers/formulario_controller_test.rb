require 'test_helper'

class FormularioControllerTest < ActionDispatch::IntegrationTest
  test "should get principal" do
    get formulario_principal_url
    assert_response :success
  end

end
