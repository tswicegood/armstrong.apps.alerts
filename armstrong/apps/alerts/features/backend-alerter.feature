Feature: Specifics of Alerter
  In order to handle alerts for a wide range of models
  As a developer
  I want to be able to create backends to handle generating alerts

  Scenario: NullBackend
    Given I have a project with alerts configured
    And I have the "NullBackend" configured
    And 1 model is registered
    When I trigger the process to attempt to send an alert
    Then 0 alerts should be fired

  Scenario: Simple Backend Processing
    Given I have a project with alerts configured
    And I have a mock backend configured
    And 1 model is registered
    When I trigger the process to attempt to send an alert
    Then 1 alert should be fired

  Scenario: Multiple Backends
    Given I have a project with alerts configured
    And I have two mock backend configured
    And 1 model is registered
    When I trigger the process to attempt to send an alert
    Then each backend should have received the alert
