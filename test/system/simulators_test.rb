require "application_system_test_case"

class SimulatorsTest < ApplicationSystemTestCase
  setup do
    @simulator = simulators(:one)
  end

  test "visiting the index" do
    visit simulators_path
    assert_selector "h1", text: "Configuração do Ambiente"
  end

  test "should create simulator" do
    visit simulators_path
    click_on "Criar Simulador"

    fill_in "Nome do Simulador:", with: @simulator.name
    click_on "Registrar"
    assert_selector "h1", text: "Configuração do Ambiente"
  end

  # test "should update Post" do
  #   visit post_url(@post)
  #   click_on "Edit this post", match: :first

  #   fill_in "Body", with: @post.body
  #   fill_in "Title", with: @post.title
  #   click_on "Update Post"

  #   assert_text "Post was successfully updated"
  #   click_on "Back"
  # end

  # test "should destroy Post" do
  #   visit post_url(@post)
  #   click_on "Destroy this post", match: :first

  #   assert_text "Post was successfully destroyed"
  # end
end
