require 'test_helper'

class EspaciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @espacio = espacios(:one)
  end

  test "should get index" do
    get espacios_url
    assert_response :success
  end

  test "should get new" do
    get new_espacio_url
    assert_response :success
  end

  test "should create espacio" do
    assert_difference('Espacio.count') do
      post espacios_url, params: { espacio: { aforo: @espacio.aforo, descripcion: @espacio.descripcion, estatus: @espacio.estatus, nombre: @espacio.nombre, servicios_adicionales: @espacio.servicios_adicionales, ubicacion: @espacio.ubicacion } }
    end

    assert_redirected_to espacio_url(Espacio.last)
  end

  test "should show espacio" do
    get espacio_url(@espacio)
    assert_response :success
  end

  test "should get edit" do
    get edit_espacio_url(@espacio)
    assert_response :success
  end

  test "should update espacio" do
    patch espacio_url(@espacio), params: { espacio: { aforo: @espacio.aforo, descripcion: @espacio.descripcion, estatus: @espacio.estatus, nombre: @espacio.nombre, servicios_adicionales: @espacio.servicios_adicionales, ubicacion: @espacio.ubicacion } }
    assert_redirected_to espacio_url(@espacio)
  end

  test "should destroy espacio" do
    assert_difference('Espacio.count', -1) do
      delete espacio_url(@espacio)
    end

    assert_redirected_to espacios_url
  end
end
