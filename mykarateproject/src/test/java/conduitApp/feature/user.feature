Feature: Tienda de Mascotas

Scenario: Create a new user
    Given url baseUrl + '/user'
    And request {
      "id": 0,
      "username": "myusername",
      "firstName": "John",
      "lastName": "Doe",
      "email": "johndoe@example.com",
      "password": "mypassword",
      "phone": "1234567890",
      "userStatus": 1
    }
    When method POST
    Then status 200

Scenario: Get user data
    Given path 'user', 'myusername'
    When method GET
    Then status 200
    And match response == {
      "id": #number,
      "username": "myusername",
      "firstName": "John",
      "lastName": "Doe",
      "email": "johndoe@example.com",
      "password": "mypassword",
      "phone": "1234567890",
      "userStatus": 1
    }