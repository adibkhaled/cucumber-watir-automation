  Feature: Therap Application features test
  We want to ensure tha the Therap homepage works.

  Scenario: Login Therap Application page
    Given I am on the devel Home Page
    When provide "justin" as a login name
    When provide "therap" as a password
    When provide "THERAP-TH" as a code
    When click Login
    Then "agree" button shows
