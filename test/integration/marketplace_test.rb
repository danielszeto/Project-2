require "test_helper"

class MarketplaceTest < ActionDispatch::IntegrationTest
  def baker(email = "baker@example.com")
    User.create!(
      first_name: "Alex", last_name: "Baker",
      email: email, password: "password123",
      age: 30, location: "San Francisco", bio: "Home bakery"
    )
  end

  test "anonymous visitors can browse bakery and sign in" do
    get root_path
    assert_response :success
    get products_path
    assert_response :success
    get sign_in_path
    assert_response :success
  end

  test "anonymous visitors cannot create listings" do
    get new_product_path
    assert_redirected_to sign_in_path
    assert_no_difference "Product.count" do
      post products_path, params: { product: { description: "Pie", category: "vegan" } }
    end
    assert_redirected_to sign_in_path
  end

  test "baker can sign in and create listing" do
    user = baker
    post "/sessions", params: { user: { email: user.email, password: "password123" } }
    assert_redirected_to user_path(user)
    assert_difference "Product.count", 1 do
      post products_path, params: { product: { description: "Apple pie", category: "vegan", available: "Tomorrow" } }
    end
    assert_redirected_to user_path(user)
    assert_equal user, Product.order(:id).last.user
    get products_path(type: "VEGAN")
    assert_response :success
    assert_includes response.body, "Apple pie"
  end

  test "another baker cannot edit or delete a listing" do
    owner = baker
    other = baker("other@example.com")
    product = owner.products.create!(description: "Cookies", category: "regular")
    post "/sessions", params: { user: { email: other.email, password: "password123" } }
    get edit_product_path(product)
    assert_response :forbidden
    assert_no_difference "Product.count" do
      delete product_path(product)
    end
    assert_response :forbidden
    patch product_path(product), params: { product: { description: "Stolen" } }
    assert_response :forbidden
    assert_equal "Cookies", product.reload.description
    get edit_user_path(owner)
    assert_response :forbidden
  end
end
