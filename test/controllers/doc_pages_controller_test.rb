require 'test_helper'

class DocPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get doc1" do
    get doc_pages_doc1_url
    assert_response :success
  end

  test "should get doc2" do
    get doc_pages_doc2_url
    assert_response :success
  end

  test "should get doc3" do
    get doc_pages_doc3_url
    assert_response :success
  end

  test "should get doc4" do
    get doc_pages_doc4_url
    assert_response :success
  end

  test "should get doc5" do
    get doc_pages_doc5_url
    assert_response :success
  end

  test "should get doc6" do
    get doc_pages_doc6_url
    assert_response :success
  end

end
