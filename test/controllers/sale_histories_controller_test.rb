require 'test_helper'

class SaleHistoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sale_histories_index_url
    assert_response :success
  end

  test "should get user_history" do
    get sale_histories_user_history_url
    assert_response :success
  end

end
