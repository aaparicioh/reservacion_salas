require 'test_helper'

class ReservacionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservacion = reservacions(:one)
  end

  test "should get index" do
    get reservacions_url
    assert_response :success
  end

  test "should get new" do
    get new_reservacion_url
    assert_response :success
  end

  test "should create reservacion" do
    assert_difference('Reservacion.count') do
      post reservacions_url, params: { reservacion: { aprobacion: @reservacion.aprobacion, fechafin: @reservacion.fechafin, fechainicio: @reservacion.fechainicio, fechasolicitud: @reservacion.fechasolicitud, horafin: @reservacion.horafin, horainicio: @reservacion.horainicio, idrepeticiones: @reservacion.idrepeticiones, nevento: @reservacion.nevento, nresponsable: @reservacion.nresponsable, repeticion: @reservacion.repeticion, tipoactividad: @reservacion.tipoactividad } }
    end

    assert_redirected_to reservacion_url(Reservacion.last)
  end

  test "should show reservacion" do
    get reservacion_url(@reservacion)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservacion_url(@reservacion)
    assert_response :success
  end

  test "should update reservacion" do
    patch reservacion_url(@reservacion), params: { reservacion: { aprobacion: @reservacion.aprobacion, fechafin: @reservacion.fechafin, fechainicio: @reservacion.fechainicio, fechasolicitud: @reservacion.fechasolicitud, horafin: @reservacion.horafin, horainicio: @reservacion.horainicio, idrepeticiones: @reservacion.idrepeticiones, nevento: @reservacion.nevento, nresponsable: @reservacion.nresponsable, repeticion: @reservacion.repeticion, tipoactividad: @reservacion.tipoactividad } }
    assert_redirected_to reservacion_url(@reservacion)
  end

  test "should destroy reservacion" do
    assert_difference('Reservacion.count', -1) do
      delete reservacion_url(@reservacion)
    end

    assert_redirected_to reservacions_url
  end
end
