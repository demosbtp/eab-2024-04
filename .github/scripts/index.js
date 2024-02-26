'use strict'

//Read local YAML file and parse it
const fs = require('fs')
const yaml = require('js-yaml')
const path = require('path')

async function createTfvarsEntitlements() {

    const normalizedPath = `..${path.sep}..${path.sep}`
    const mtaPath = (process.env.MTA_PATH) ? `${normalizedPath}${process.env.MTA_PATH}` : `${normalizedPath}src${path.sep}mta.yaml`;
    const targetPath = (process.env.PATH_TO_TFSCRIPT) ? `${normalizedPath}${process.env.PATH_TO_TFSCRIPT}` : `${normalizedPath}scripts${path.sep}setup_dev_account`;

    try {
        const yamlData = yaml.load(fs.readFileSync(mtaPath, 'utf8'));

        const NumberOfEntries = yamlData.resources.length;

        if (NumberOfEntries === 0) {
            console.log('No resources found');
            return;
        }

        let counter = 0;
        let tfvarsEntitlements = `entitlements = [ \n`;
        // Loop over the resources in yamlData.resources
        for (const resource of yamlData.resources) {

            tfvarsEntitlements += `  { \n`;
            tfvarsEntitlements += `     name =  "${resource.parameters.service}" \n`;
            tfvarsEntitlements += `     plan =  "${resource.parameters['service-plan']}" \n`;
            tfvarsEntitlements += `     amount =  null \n`;

            if (counter === NumberOfEntries - 1) {
                tfvarsEntitlements += `  } \n`;
            }
            else {
                tfvarsEntitlements += `  }, \n`;
            }
            counter++;
        }

        tfvarsEntitlements += `] \n`;

        //console.log(tfvarsEntitlements);
        fs.writeFileSync(`${targetPath}${path.sep}serviceentitlements.tfvars`, tfvarsEntitlements);
        console.log('serviceentitlements.tfvars created');

    } catch (error) {
        console.error(error);
    }
}

// Ugly starter of function
(async () => { await createTfvarsEntitlements() })()