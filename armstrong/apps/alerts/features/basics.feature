Feature: Alerting for Content
  In order to send alerts for various content on the site
  As a developer
  I want to be able to specify models that should send notifications

  Scenario: Nothing registered
    Given I have a sample project with alerts enabled
    And I have no models registered to send alerts
    When I save a generic model
    Then "0" notifications should have been queued

  Scenario: Model registered
    Given I have a sample project with alerts enabled
    And I have one model registered to send alerts
    When I save that model
    Then "1" notification should have been queued

  Scenario: Model registered, but does match
    Given I have a sample project with alerts enabled
    And I have one model registered to send alerts
    And the registered backend does not match it
    When I save that model
    Then "0" notifications should have been queued
