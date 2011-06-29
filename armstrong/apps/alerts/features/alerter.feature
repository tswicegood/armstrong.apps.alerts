Feature: Alerter Admin
  In order to control what alerts my users receive
  As an administrator on the site
  I want to be able to control what models are elligible for alerting

  Scenario: No models registered
    Given I have a project with alerts configured
    And "0" models are registered
    When I load "/admin/alerts/alertablemodel/"
    Then I should see "0" AlertableModels

  Scenario: Registering models as alertable
    Given I have a project with alerts configured
    And "0" model is registered
    When I load "/admin/alerts/alertablemodel/add/"
    And select a model type
    And click "Save"
    Then I should see "1" AlertableModel

  Scenario: No scheduled alerts
    Given I have a project with alerts configured
    And "1" models is registered
    When I load "/admin/alerts/queuedalerts/"
    Then I should see "0" QueuedAlert

  Scenario: Seeing scheduled alerts
    Given I have a project with alerts configured
    And "1" models is registered
    When I save a model that is set to alert
    And load "/admin/alerts/queuedalerts/"
    Then I should see "1" QueuedAlert
