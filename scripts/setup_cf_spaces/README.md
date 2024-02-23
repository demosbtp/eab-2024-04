# Setting up a sub account for the EAB meeting on April 2024

## Overview

This script creates the necessary setup for a dev environment (BAS).

## Deploying the resources

To deploy the resources you must:

1. Export the variables for user name and password

   ```bash
   export BTP_USERNAME='<Email address of your BTP user>'
   export BTP_PASSWORD='<Password of your BTP user>'
   ```

2. Change the variables in the `terraform.tfvars` file to meet your requirements

3. Initialize your workspace:

   ```bash
   terraform init
   ```

4. You can check what Terraform plans to apply based on your configuration:

   ```bash
   terraform plan 
   ```

5. Apply your configuration to provision the resources:

   ```bash
   terraform apply 
   ```

## In the end

You probably want to remove the assets after trying them out to avoid unnecessary costs. To do so execute the following command:

```bash
terraform destroy
```
