Feature: Therap Application features test
  We want to ensure that the Therap Diagonasis Feature works.

  Background: Login Therap Application page
    Given I am on the devel Home Page
    When provide "justin" as a login name
    When provide "therap" as a password
    When provide "THERAP-TH" as a code
    When click Login
    Then "agree" button shows

  Scenario: ICD-9/ICD-10/DSM-5 Diagnosis code create
    Given I am click on the Code ICD-9 New Page
    When provide "ADK-301" as a diagnosis code
    When provide "ICDDSM" as a code Type
    When provide "Diagnosis Description" as Description
    When click ICD9 Save
    Then shows "Diagnosis Code successfully saved" message in ICD9 done page

    Given I am click on the Code ICD-10 New Page
    When provide "ADK-301" as a IC10diagnosis code
    When provide "ICD 10 Diagnosis Description" as ICD10 Description
    When click ICD10 Save
    Then shows "Diagnosis Code successfully saved" message in ICD9 done page


