#!/bin/bash

#json_string='{
#    "eu10": {
#        "cf_api_endpoint": "https://api.cf.eu10.hana.ondemand.com",
#        "cf_env_instance_id": "abc123",
#        "cf_org_id": "abc123"
#    },
#    "us10": {
#        "cf_api_endpoint": "https://api.cf.us10.hana.ondemand.com",
#        "cf_env_instance_id": "xyz789",
#        "cf_org_id": "xyz789"
#    }
#}'

# Iterate over the keys and extract values
while read -r key; do
    # For the Provider authentication
    cf_api_endpoint=$(echo "$json_string" | jq -r ".$key.cf_api_endpoint")
    # For the variables
    cf_org_id=$(echo "$json_string" | jq -r ".$key.cf_org_id")

    # Set environment variables
    export "$CF_API_URL=$cf_api_endpoint"
    
    terraform -chdir=$PATH_TO_TFSCRIPT_CF init -no-color 
    terraform -chdir=$PATH_TO_TFSCRIPT_CF apply -auto-approve -no-color -var cf_org_id=$cf_org_id

    echo "Set ${key}_CF_API_ENDPOINT=$cf_api_endpoint"
    echo "Set ${key}_CF_ORG_ID=$cf_org_id"
done < <( echo "$CF_API_DETAILS" | jq -r 'keys[]' )
#done < <( echo "$json_string" | jq -r 'keys[]' )



