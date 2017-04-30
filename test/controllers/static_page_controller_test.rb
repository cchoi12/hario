require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest
  test 'static page is root' do
    get root_path
    assert_response :success
  end
end
