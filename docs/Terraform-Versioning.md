# Terraform Versioning

## Requirements

- All custom terraform modules **MUST** be assigned a version number.
  - A version numbers **MAY** be tied to one or more module.
- All terraform scripts **MUST** specify a version number when accessing a custom module.
- Different labs/environments **MUST** support running different versions of the same module.
- All custom terraform modules **MUST** be stored in a single repository.
- All terraform scripts **SHOULD** be stored in the same repository as the modules.
- All terraform modules & scripts **MUST** be versioned based on a `dev` branch commit.

## Process

- Create a PR for module or script changes.
  - Trigger `megalinter` action.
  - Trigger `terraform-docs` generation action when modules change.
  - Trigger `plan apply non-prod` action.
    - Run `tf init`, `tf fmt`, `tf plan`

- Approve a PR for merge to dev.
  - Trigger `version-modules` action.
  - Trigger `plan apply non-prod` action.
    - Run `tf apply`

### Action Notes

**version-modules**


## Appendix


[](https://medium.com/forto-tech-blog/automated-versioning-of-terraform-modules-with-github-actions-semver-style-800f91ed5037)
