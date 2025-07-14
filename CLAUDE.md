# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a FHIR Implementation Guide (IG) project for Ontario Health eForms, built using FHIR Shorthand (FSH) and the SUSHI compiler. The project defines FHIR profiles, extensions, operations, and examples for managing electronic forms workflows in Ontario's healthcare system.

## Development Commands

### Initial Setup
```bash
# Install SUSHI globally (required)
npm install -g fsh-sushi

# Update IG Publisher to latest version
./_updatePublisher.sh    # macOS/Linux
_updatePublisher.bat     # Windows
```

### Build Commands
```bash
# Compile FSH files to FHIR JSON resources only
sushi build .

# Quick build without full IG generation
./_build.sh             # macOS/Linux
_build.bat              # Windows

# Generate complete Implementation Guide (includes SUSHI build + IG Publisher)
./_genonce.sh           # macOS/Linux  
_genonce.bat            # Windows

# Continuous build mode (watches for changes)
./_gencontinuous.sh     # macOS/Linux
_gencontinuous.bat      # Windows
```

### Testing and Validation
```bash
# The IG Publisher performs validation automatically during build
# Check validation results:
open output/qa.html                    # View validation report
cat output/qa.txt                      # View validation summary  
grep -i error output/qa.txt            # Find errors quickly
```

### Viewing Results
```bash
# Open generated IG in browser
open output/index.html

# Or serve locally and view
cd output && python -m http.server 8000
```

## Architecture and Structure

### Core FSH Organization
- `input/fsh/Alias.fsh` - Central alias definitions for all canonical URLs and common references
- `input/fsh/profiles/` - FHIR profile definitions extending base/SDC resources
- `input/fsh/extensions/` - Custom extension definitions  
- `input/fsh/terminology/` - CodeSystems and ValueSets
- `input/fsh/operations/` - OperationDefinition instances
- `input/fsh/examples/` - Example instances organized by resource type

### Key Design Patterns

**Profile Inheritance**: Most profiles extend SDC (Structured Data Capture) profiles rather than base FHIR resources:
- EFormsTaskProfile extends `sdc-task`
- EFormsServiceRequest extends `sdc-servicerequest` 
- EFormQuestionnaire extends `sdc-questionnaire`

**Workflow Model**: The system uses a Task-based workflow:
1. ServiceRequest represents the overall form request
2. Task resources manage individual workflow steps
3. Questionnaire/QuestionnaireResponse handle form data
4. Custom business status extensions track workflow states

**Naming Conventions**:
- Profiles: `EForm[ResourceType]` or `EForms[ResourceType]Profile`
- Extensions: `[name]-Ext` suffix
- CodeSystems: `[name]-CS` suffix  
- ValueSets: `[name]-VS` suffix
- Operations: `[name]-OD` suffix

### Configuration Files
- `sushi-config.yaml` - Main SUSHI configuration with IG metadata, dependencies, and build parameters
- `ig.ini` - IG Publisher configuration pointing to generated ImplementationGuide resource
- `input/ignoreWarnings.txt` - Suppressed validation warnings

### Key Dependencies
- `hl7.fhir.uv.sdc: 4.0.0-ballot` - Structured Data Capture profiles and extensions
- `fhir.base.template#current` - Base IG template

## Working with FSH Files

### Alias Usage
Always use the aliases defined in `Alias.fsh` for consistency:
- `$SDCTaskCanonical` for SDC Task profile
- `$EFormPatient` for EForm Patient profile
- `$EFormsBusinessStatusVS` for business status value set

### Profile Development
When creating new profiles:
1. Determine appropriate parent (usually an SDC profile)
2. Add alias to `Alias.fsh` if creating new canonical URLs
3. Follow existing naming patterns
4. Include MS (Must Support) flags appropriately
5. Add invariants for business rules when needed

### Extension Development  
Custom extensions follow the pattern:
- Define in `extensions/` folder with `-Ext` suffix
- Register canonical URL in aliases
- Include version and status metadata

## Generated Output
- `fsh-generated/` - SUSHI-generated FHIR JSON resources
- `output/` - Complete IG website with validation results
- `temp/` - Temporary IG Publisher working files

## OpenAPI Integration
The project includes OpenAPI specifications in `openAPI/` for various system integrations (OAG, OTN, Smile).

## Common Development Patterns

### Adding New Profiles
1. Create new profile file in `input/fsh/profiles/`
2. Add canonical URL alias to `input/fsh/Alias.fsh`  
3. Follow naming convention: `EForm[ResourceType]` or `EForms[ResourceType]Profile`
4. Extend appropriate SDC profile when available
5. Build and validate: `./_genonce.sh`

### Creating Examples
1. Place in appropriate subfolder under `input/fsh/examples/`
2. Use profile aliases for InstanceOf declarations
3. Reference other examples using logical IDs
4. Validate examples compile correctly with `sushi build .`

### Working with Extensions
1. Define in `input/fsh/extensions/` with `-Ext` suffix
2. Add canonical URL to aliases
3. Use appropriate context and cardinality
4. Apply to profiles using extension slicing patterns

## Common Issues
- **SUSHI Installation**: Ensure SUSHI is installed globally before building
- **Canonical URLs**: Validation errors often relate to missing or incorrect canonical URLs - always use aliases from `Alias.fsh`
- **Profile References**: Use profile aliases rather than full URLs for consistency
- **FSH Syntax**: Check console output for FSH compilation errors before running IG Publisher
- **Dependencies**: Ensure SDC dependency version matches what's referenced in profiles
- **Validation**: Always check `output/qa.html` for detailed validation feedback after builds

## Troubleshooting Commands
```bash
# Clear generated files and rebuild
rm -rf fsh-generated/ output/ temp/
./_genonce.sh

# Check SUSHI compilation only
sushi build . --debug

# Validate specific resource
java -jar input-cache/publisher.jar -validate output/StructureDefinition-[name].json
```

## Publication
The IG is automatically published to GitHub Pages via GitHub Actions when changes are pushed to the main branch. View published IG at: https://joelpettis.github.io/eFormsIG/

### MCP Servers
MCP servers are not applicable to this FHIR IG project as it focuses on FSH compilation and FHIR resource generation rather than Model Context Protocol implementations.