[![.github/workflows/codecov.yaml](https://github.com/rmaloloyon/atlantis-example/actions/workflows/codecov.yaml/badge.svg?branch=master)](https://github.com/rmaloloyon/atlantis-example/actions/workflows/codecov.yaml)

# Atlantis Setup Guide for GitHub Actions

## Introduction
### Loud and Clear

[Atlantis](https://www.runatlantis.io/) is a tool that helps you automate Terraform workflows. In this guide, we'll set up Atlantis to work with GitHub Actions for managing your Terraform configurations.

## Prerequisites

- A GitHub repository containing your Terraform configurations.
- GitHub Actions enabled for your repository.

## Steps

### 1. Create GitHub Personal Access Token

1. Go to your GitHub account settings.
2. Navigate to "Developer settings" > "Personal access tokens" > "Generate token."
3. Select the necessary scopes such as `repo` and `workflow`.
4. Click "Generate token" and copy the generated token.

### 2. Configure GitHub Secrets

1. In your GitHub repository, go to "Settings" > "Secrets" > "New repository secret."
2. Add a new secret with the name `ATLANTIS_GH_TOKEN` and paste the GitHub Personal Access Token you generated.

### 3. Create Atlantis Configuration

1. Create a file named `.atlantis.yaml` in the root of your Terraform project.

   ```yaml
   # .atlantis.yaml

   projects:
   - name: my-terraform-project
     dir: path/to/terraform/config
     autoplan:
       when_modified: ["*.tf", "*.hcl"]
