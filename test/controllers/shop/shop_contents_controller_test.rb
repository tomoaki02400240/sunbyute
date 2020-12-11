require 'test_helper'

class Shop::ShopContentsControllerTest < ActionDispatch::IntegrationTest
  test "should get des" do
    get shop_shop_contents_des_url
    assert_response :success
  end

end
