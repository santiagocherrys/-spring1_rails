require "test_helper"

class Api::V1::CoffeeControllerTest < ActionDispatch::IntegrationTest
  # Load fixtures
  fixtures :coffees

  test "should get index" do
    get api_v1_coffee_path
    assert_response :success

    # Check the response matches the fixture data
    response_data = JSON.parse(response.body)
    assert_equal 3, response_data.size
    assert_equal "Location One", response_data[0]["ubicacion"]
    assert_equal "Location Two", response_data[1]["ubicacion"]
    assert_equal "Location Three", response_data[2]["ubicacion"]
  end

  test "should show coffee" do
    coffee = coffees(:coffee_one)
    get api_v1_path(coffee.id)
    assert_response :success

    response_data = JSON.parse(response.body)
    assert_equal coffee.ubicacion, response_data["ubicacion"]
    assert_equal coffee.vacio, response_data["vacio"]
    assert_equal coffee.estado, response_data["estado"]
  end

  test "should create coffee" do
    assert_difference('Coffee.count') do
      post api_v1_coffee_path, params: { coffee: { ubicacion: "New Location", vacio: false, estado: "procesando" } }
    end
    assert_response :created
  
    response_data = JSON.parse(response.body)
    assert_equal "New Location", response_data["ubicacion"]
  
    # Optionally, check if the newly created coffee can be retrieved
    new_coffee = Coffee.last
    get api_v1_coffee_path(new_coffee.id)
    assert_response :success
    response_data = JSON.parse(response.body)
    puts "aqui comienza: AAAAAA: #{response_data.inspect}"
    puts "Esto devuelte"
    puts response_data[3]["ubicacion"]
    puts new_coffee.ubicacion
    assert_equal new_coffee.ubicacion, response_data[3]["ubicacion"]
  end

  test "should update coffee" do
    coffee = coffees(:coffee_one)
    patch api_v1_path(coffee.id), params: { coffee: { ubicacion: "Updated Location" } }
    assert_response :success

    coffee.reload
    assert_equal "Updated Location", coffee.ubicacion
  end

  test "should destroy coffee" do
    coffee = coffees(:coffee_one)
    assert_difference('Coffee.count', -1) do
      delete api_v1_path(coffee.id)
    end
    assert_response :no_content
  end

  test "should mark last coffee as empty" do
    get api_v1_coffee_ask_path
    assert_response :success

    last_coffee = Coffee.last
    assert_equal true, last_coffee.vacio
  end
end
