# Caption Health Template Repo

This repo contains best practices and workflows for Caption Health projects.
It can be used as a [template for starting new repos][template repo], or
individual files can be copied into an existing repo. This repo supports
WI-00013 versioning and [WI-00014] branching strategies.

## Repo configuration

Every new repo should be configured once created, even if it was created from
this template repo.

### Repo settings

Update the following settings under __Settings > Options__

* Uncheck __all__ checkboxes under _Features_
* Uncheck 'Allow rebase merging' and 'Allow merge commits'
    under _Merge Button_
    > Squash commits are easier to revert and cherry-pick
* Check 'Automatically delete head branches'
* Ensure repo visibility is `Internal`

### Branch settings

The default branch for Caption Health repos is `dev`.

[Branch protection rules] are used to control how new commits are pushed to
specific branches. They also protect git branches from force-pushes and
deletion. Set up the following branch protection rules
under __Settings > Branches__:

* Branch name pattern: `dev`
  * Check 'Require pull request reviews before merging'
    * Ensure 'Required approving reviews' is 1
    * Check 'Dismiss stale pull request approvals when new
          commits are pushed'
    * Check 'Require review from Code Owners'
  * Check 'Require status checks to pass before merging'
    * Ensure 'Require branches to be up to date before merging' is
          __checked__
  * Check 'Include administrators'
* Branch name pattern: `*.*-release`
  * Check 'Include administrators'

### Access settings

By default all Caption Health org members are granted Write access to all repos.
However, in order to trigger CODEOWNERS reviews, teams should be granted
Write access at the repo level. This is configured
under __Settings > Manage Access__.

### CODEOWNERS

A [CODEOWNERS] file works in conjunction with branch protection rules to ensure
all stakeholders are notified and have a chance to review code changes in the
repo. CODEOWNERs assignments for the repo are kept in _.github/CODEOWNERS_.
CODEOWNERS should always be assigned to teams instead of individuals in order
to avoid risk of blocked PRs when teammates are OOO.

### Pull request template

The [PULL_REQUEST_TEMPLATE] file in the repo sets up default text for new PRs.
The file at _.github/PULL_REQUEST_TEMPLATE_ contains some example prompts that
might be helpful.

### Actions (CI)

Use [Github Actions] to set up test, build, and release pipelines for repos.
Github Actions provides access to Ubuntu, Windows, and MacOS hardware to run
build steps. This repo comes with some example workflows under
_.github/workflows_ that you can use with your repo.

#### release-notifications.yml

Sends Slack notifications when releases are created, edited, and deleted. Make
sure to update the value of the SLACK_CHANNEL environment variable to the
channel ID of the Slack channel where notifications are posted.

#### workflow-notifications.yml

Sends Slack notifications when other workflows are queued and completed. Make
sure to update the value of the SLACK_CHANNEL environment variable to the
channel ID of the Slack channel where notifications are posted. Make sure the
list in `on.workflow_run.workflows` in the workflow file has the names of
workflows that should trigger notifications.

> SLACK_CHANNEL defaults to the [#buildbot-test] channel if not updated in
> these workflows.

### Releases (Artifact management)

Use [Github Releases] to store build artifacts for tagged releases.

<!-- References -->

[Branch protection rules]:https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches
[#buildbot-test]: https://caption-health.slack.com/archives/C01J1EJ6B9C
[CODEOWNERS]:https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/about-code-owners
[Github Actions]: https://docs.github.com/en/actions
[Github Releases]: https://docs.github.com/en/repositories/releasing-projects-on-github/about-releases
[PULL_REQUEST_TEMPLATE]: https://docs.github.com/en/communities/using-templates-to-encourage-useful-issues-and-pull-requests/creating-a-pull-request-template-for-your-repository
[template repo]:https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template
[WI-00014]:https://docs.google.com/document/d/1updZOyxJf-OQLB7vQ-A0dnx3h-0_ibRwgN2-DT58kTA/edit#heading=h.if0os92r50ge

### Keeping your supply chain secure with Dependabot

Monitor vulnerabilities in dependencies used in your project and keep your dependencies up-to-date with [Dependabot](https://docs.github.com/en/code-security/dependabot).

When the base project structure is configured you need to run PowerShell script _.github/scripts/update-dependabot.ps1_ that creates an initial _dependabot.yml_ file based on your project structure. In addition, it might be used to update the existing version of the file in case of solution's structure changes.
<!-- BEGIN_TF_DOCS -->
<!-- markdown-table-prettify-ignore-start -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- markdown-table-prettify-ignore-end -->

<!-- END_TF_DOCS -->
