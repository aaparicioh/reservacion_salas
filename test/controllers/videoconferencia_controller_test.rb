require 'test_helper'

class VideoconferenciaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @videoconferencium = videoconferencia(:one)
  end

  test "should get index" do
    get videoconferencia_url
    assert_response :success
  end

  test "should get new" do
    get new_videoconferencium_url
    assert_response :success
  end

  test "should create videoconferencium" do
    assert_difference('Videoconferencium.count') do
      post videoconferencia_url, params: { videoconferencium: {  } }
    end

    assert_redirected_to videoconferencium_url(Videoconferencium.last)
  end

  test "should show videoconferencium" do
    get videoconferencium_url(@videoconferencium)
    assert_response :success
  end

  test "should get edit" do
    get edit_videoconferencium_url(@videoconferencium)
    assert_response :success
  end

  test "should update videoconferencium" do
    patch videoconferencium_url(@videoconferencium), params: { videoconferencium: {  } }
    assert_redirected_to videoconferencium_url(@videoconferencium)
  end

  test "should destroy videoconferencium" do
    assert_difference('Videoconferencium.count', -1) do
      delete videoconferencium_url(@videoconferencium)
    end

    assert_redirected_to videoconferencia_url
  end
end
