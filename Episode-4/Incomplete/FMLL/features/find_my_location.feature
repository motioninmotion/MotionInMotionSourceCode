Feature: Find my location
  As a user of FMLL
  I would like to find my latitude and longitude
  So that I can use it as needed

  Scenario: Location services are enabled
    Given location services are turned on
    And I launch the app
    Then I wait to see "37.7858276367188"
    And I wait to see "-122.406417"