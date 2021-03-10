require 'integration_test_helper'
class PersonTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select "h1", "Pessoas de Interesse"
  end
  test "can create a person" do
    get "/persones/new"
    assert_response :success

    post "/persones",
         params: { person: {name: "Pedro",birthdate: "1978-10-20",email: 'pedro@gmail.com',twitter: 'pedro',
                            phone_number: '15-998764530',profession: "Engenheiro",career_id: careeres(:career1).id,
                            pais_id: paises(:brasil).id} }

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "td", "Pedro"
  end
  test "can edit a person" do
    get "/persones/edit/1"
    assert_response :success

    post "/persones",
         params: { person: {name: "Pedro",birthdate: "1978-10-20",email: 'pedro@gmail.com',twitter: 'pedro',
                            phone_number: '15-998764530',profession: "Engenheiro",career_id: careeres(:career1).id,
                            pais_id: paises(:brasil).id} }

    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "td", "Pedro"
  end

end
