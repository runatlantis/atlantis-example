# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a simple Terraform example repository designed for use with [Atlantis](https://www.runatlantis.io/) testdrive mode. It contains minimal Terraform configurations across three environments (dev, staging, prod) for demonstrating Atlantis Pull Request automation.

## Repository Structure

- `dev/`, `staging/`, `prod/` - Terraform configurations per environment
- `bin/a-server` - Local Atlantis server startup script (requires `ATLANTIS_WEBHOOK_SECRET` and `ATLANTIS_TOKEN` environment variables)

## Working with Terraform

```bash
# Initialize Terraform in an environment
cd dev && terraform init

# Plan changes
terraform plan

# Apply changes
terraform apply
```

