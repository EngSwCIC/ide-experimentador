require "test_helper"

class ExperimentosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get experimentos_index_url
    assert_response :success
  end
end
