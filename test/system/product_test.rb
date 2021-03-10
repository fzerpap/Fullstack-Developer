require 'test_helper'
#require 'integration_test_helper'

class ProductTest < Capybara::Rails::TestCase

  test "viewing the index without authentication" do
    visit products_path
    assert_not page.has_content?("New Product")
  end
  

  test "viewing the index with authentication" do
    login()

    #visit index products
    visit products_path
    assert page.has_content?("New Product")
  end


  test 'showing to product' do
    login()

    visit products_path
    click_on 'Show'
    assert page.has_content?("Name")
    assert page.has_content?("Price")

  end

  test 'editing a product' do
    login()

    visit products_path
    click_on 'Edit'
    fill_in "Name", with: "Cabify Voucher?"
    click_on "Save"
    assert page.has_content?("Cabify Voucher?")

  end

  test 'deleting a product' do
    login()

    visit products_path
    click_on 'Destroy'
    assert_not page.has_content?("Voucher")

  end

  test 'getting form a new product' do
    login()

    visit products_path
    click_on "New Product"
    assert page.has_content?("Name")
  end

  test 'writing a new product' do
    login()

    visit products_path
    click_on "New Product"

    fill_in "Barcod", with: "2020"
    fill_in "Name", with: "Shoes"
    fill_in "Price", with: "35.5"
    find('#discount-select').find(:xpath, 'option[1]').select_option
    click_on "Save"

    assert_current_path product_path(Product.last)
    assert page.has_content?('Shoes')

  end

  # writing a new product with fields require presence as null
  test 'writing a new product with every field null' do
    login()

    visit products_path
    click_on "New Product"
    click_on "Save"

    assert page.has_content?('')

  end

  test 'writing a new product with code already exists' do
    login()

    visit products_path
    click_on "New Product"
    fill_in "Barcode:", with: "1010"
    fill_in "Name:", with: "Voucher"
    fill_in "Price", with: "5.0"
    find('#discount-select').find(:xpath, 'option[1]').select_option
    click_on "Save"

    assert page.has_content?('Code has already been token')

  end

end
