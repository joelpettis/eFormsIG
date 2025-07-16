#!/usr/bin/env node

/**
 * Generate Postman Collection for eForms FHIR Resources
 * This script creates a Postman collection with requests for all FHIR resources in the IG
 */

const fs = require('fs');
const path = require('path');

// Base configuration
const config = {
  baseUrl: "{{baseUrl}}", // Postman variable
  igCanonical: "http://ontario.ca/fhir/eforms",
  version: "0.1.0"
};

// Find all JSON files in fsh-generated/resources
const resourcesDir = path.join(__dirname, '../fsh-generated/resources');
const resourceFiles = fs.readdirSync(resourcesDir)
  .filter(file => file.endsWith('.json'))
  .map(file => {
    const content = JSON.parse(fs.readFileSync(path.join(resourcesDir, file), 'utf8'));
    return {
      filename: file,
      resourceType: content.resourceType,
      id: content.id,
      name: content.name || content.title || content.id
    };
  });

// Group resources by type
const resourcesByType = resourceFiles.reduce((acc, resource) => {
  if (!acc[resource.resourceType]) {
    acc[resource.resourceType] = [];
  }
  acc[resource.resourceType].push(resource);
  return acc;
}, {});

// Generate Postman collection
const collection = {
  info: {
    name: "Ontario Health eForms FHIR API",
    description: `Postman collection for testing eForms FHIR resources.
    
Generated from Implementation Guide version ${config.version}.
    
Before using:
1. Set the 'baseUrl' environment variable to your FHIR server base URL
2. Configure authentication if required
3. Ensure your FHIR server has the eForms IG package installed`,
    version: config.version,
    schema: "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  variable: [
    {
      key: "baseUrl",
      value: "http://localhost:8080/fhir",
      description: "Base URL of your FHIR server"
    }
  ],
  item: []
};

// Create folders for each resource type
Object.keys(resourcesByType).sort().forEach(resourceType => {
  const folder = {
    name: `${resourceType} Resources`,
    description: `Operations for ${resourceType} resources in the eForms IG`,
    item: []
  };

  // Add CRUD operations for each resource
  resourcesByType[resourceType].forEach(resource => {
    // GET (Read)
    folder.item.push({
      name: `GET ${resource.name}`,
      request: {
        method: "GET",
        header: [
          {
            key: "Accept",
            value: "application/fhir+json"
          }
        ],
        url: {
          raw: `${config.baseUrl}/${resourceType}/${resource.id}`,
          host: ["{{baseUrl}}"],
          path: [resourceType, resource.id]
        },
        description: `Retrieve the ${resource.name} resource`
      },
      response: []
    });

    // PUT (Update)
    folder.item.push({
      name: `PUT ${resource.name}`,
      request: {
        method: "PUT",
        header: [
          {
            key: "Content-Type",
            value: "application/fhir+json"
          },
          {
            key: "Accept",
            value: "application/fhir+json"
          }
        ],
        body: {
          mode: "file",
          file: {
            src: `../fsh-generated/resources/${resource.filename}`
          }
        },
        url: {
          raw: `${config.baseUrl}/${resourceType}/${resource.id}`,
          host: ["{{baseUrl}}"],
          path: [resourceType, resource.id]
        },
        description: `Update the ${resource.name} resource`
      },
      response: []
    });

    // DELETE
    folder.item.push({
      name: `DELETE ${resource.name}`,
      request: {
        method: "DELETE",
        header: [
          {
            key: "Accept",
            value: "application/fhir+json"
          }
        ],
        url: {
          raw: `${config.baseUrl}/${resourceType}/${resource.id}`,
          host: ["{{baseUrl}}"],
          path: [resourceType, resource.id]
        },
        description: `Delete the ${resource.name} resource`
      },
      response: []
    });
  });

  // Add search operations for the resource type
  folder.item.push({
    name: `Search ${resourceType}`,
    request: {
      method: "GET",
      header: [
        {
          key: "Accept",
          value: "application/fhir+json"
        }
      ],
      url: {
        raw: `${config.baseUrl}/${resourceType}`,
        host: ["{{baseUrl}}"],
        path: [resourceType],
        query: [
          {
            key: "_profile",
            value: `${config.igCanonical}/StructureDefinition/EForm${resourceType}`,
            description: "Filter by eForms profile",
            disabled: true
          },
          {
            key: "_count",
            value: "10",
            description: "Limit results",
            disabled: true
          }
        ]
      },
      description: `Search for ${resourceType} resources`
    },
    response: []
  });

  collection.item.push(folder);
});

// Add validation folder
const validationFolder = {
  name: "Validation",
  description: "Validate resources against eForms profiles",
  item: []
};

// Add validation requests for each resource type that has profiles
const profiledResources = ['Questionnaire', 'QuestionnaireResponse', 'Task', 'ServiceRequest'];
profiledResources.forEach(resourceType => {
  validationFolder.item.push({
    name: `Validate ${resourceType}`,
    request: {
      method: "POST",
      header: [
        {
          key: "Content-Type",
          value: "application/fhir+json"
        },
        {
          key: "Accept",
          value: "application/fhir+json"
        }
      ],
      body: {
        mode: "raw",
        raw: `{
  "resourceType": "Parameters",
  "parameter": [
    {
      "name": "resource",
      "resource": {
        "resourceType": "${resourceType}",
        "meta": {
          "profile": ["${config.igCanonical}/StructureDefinition/EForm${resourceType}"]
        }
      }
    }
  ]
}`,
        options: {
          raw: {
            language: "json"
          }
        }
      },
      url: {
        raw: `${config.baseUrl}/${resourceType}/$validate`,
        host: ["{{baseUrl}}"],
        path: [resourceType, "$validate"]
      },
      description: `Validate a ${resourceType} against the EForm${resourceType} profile`
    },
    response: []
  });
});

collection.item.push(validationFolder);

// Add workflow examples folder
const workflowFolder = {
  name: "Workflow Examples",
  description: "Example workflows using eForms resources",
  item: [
    {
      name: "Create Form Request Workflow",
      request: {
        method: "POST",
        header: [
          {
            key: "Content-Type",
            value: "application/fhir+json"
          }
        ],
        body: {
          mode: "raw",
          raw: `{
  "resourceType": "Bundle",
  "type": "transaction",
  "entry": [
    {
      "request": {
        "method": "POST",
        "url": "ServiceRequest"
      },
      "resource": {
        "resourceType": "ServiceRequest",
        "meta": {
          "profile": ["${config.igCanonical}/StructureDefinition/EFormsServiceRequest"]
        },
        "status": "active",
        "intent": "order",
        "code": {
          "coding": [
            {
              "system": "${config.igCanonical}/CodeSystem/task-code",
              "code": "questionnaire"
            }
          ]
        },
        "subject": {
          "reference": "Patient/example"
        }
      }
    }
  ]
}`,
          options: {
            raw: {
              language: "json"
            }
          }
        },
        url: {
          raw: `${config.baseUrl}`,
          host: ["{{baseUrl}}"]
        },
        description: "Create a complete form request workflow"
      },
      response: []
    }
  ]
};

collection.item.push(workflowFolder);

// Write the collection to file
const outputPath = path.join(__dirname, '../output/eforms-postman-collection.json');
fs.writeFileSync(outputPath, JSON.stringify(collection, null, 2));

console.log(`Postman collection generated: ${outputPath}`);
console.log(`Found ${resourceFiles.length} resources in ${Object.keys(resourcesByType).length} resource types`);
console.log(`Collection includes ${collection.item.length} folders with CRUD operations, validation, and workflow examples`);