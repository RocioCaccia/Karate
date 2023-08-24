Feature: JSON peticion pet/findByStatus

Background:
  * url baseUrl

Scenario: Listar nombres de mascotas vendidas
  Given path '/pet/findByStatus?status=sold'
  When method GET
  Then status 200
  * def pets = response
  * def soldPets = karate.filter(pets, function(pet){ return pet.status == 'sold' })
  * def petNames = karate.map(soldPets, function(pet){ return {id: pet.id, name: pet.name} })
  * print 'Nombres de mascotas vendidas:', petNames
