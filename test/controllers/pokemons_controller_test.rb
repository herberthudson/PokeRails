require 'test_helper'

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get pokemons_view_url
    assert_response :success
  end

end
