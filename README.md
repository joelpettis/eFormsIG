# Ontario Health eForms Implementation Guide

This repository contains the FHIR Implementation Guide for Ontario Health eForms, built using FHIR Shorthand (FSH) and the SUSHI compiler.

**📖 Published IG**: [https://joelpettis.github.io/eFormsIG/](https://joelpettis.github.io/eFormsIG/)

![Build Status](https://github.com/yourusername/yourrepo/workflows/Deploy%20to%20GitHub%20Pages/badge.svg)

![FHIR Overview](input/images/FSH.png)

## Quick Start

```bash
git clone [this-repository]
cd eFormsIG
npm install -g fsh-sushi
./_genonce.sh
open output/index.html
```

## 📁 Project Structure

```
eFormsIG/
├── input/
│   ├── fsh/                          # FSH source files
│   │   ├── Alias.fsh                 # Central alias definitions
│   │   ├── profiles/                 # FHIR profile definitions
│   │   ├── extensions/               # Custom extension definitions
│   │   ├── terminology/              # CodeSystems and ValueSets
│   │   ├── operations/               # OperationDefinition instances
│   │   └── examples/                 # Example instances by resource type
│   ├── pagecontent/                  # Markdown pages for the IG
│   │   ├── index.md                  # Home page
│   │   ├── implementation.md         # Implementation guidance
│   │   ├── examples.md               # Examples overview
│   │   ├── downloads.md              # Downloads page
│   │   ├── changes.md                # Change log
│   │   ├── cross-version-analysis.md # Version analysis
│   │   ├── dependency-table.md       # Dependencies
│   │   └── globals-table.md          # Global patterns
│   └── images/                       # Images and diagrams
├── scripts/
│   └── generate-postman-collection.js # Postman collection generator
├── sushi-config.yaml                 # IG configuration
├── CLAUDE.md                         # Claude Code instructions
└── README.md                         # This file
```

## 🛠️ Development Commands

### Initial Setup
```bash
npm install -g fsh-sushi              # Install SUSHI globally
./_updatePublisher.sh                 # Update IG Publisher (macOS/Linux)
_updatePublisher.bat                  # Update IG Publisher (Windows)
```

### Build Commands
```bash
sushi build .                         # Compile FSH to FHIR JSON only
./_genonce.sh                         # Full IG build (macOS/Linux)
_genonce.bat                          # Full IG build (Windows)
./_gencontinuous.sh                   # Continuous build mode (macOS/Linux)
```

### Validation
```bash
open output/qa.html                   # View validation report
grep -i error output/qa.txt           # Find errors quickly
```

## 📝 Maintainer Guide

### When to Update Each Page

#### 🔄 **Always Update When Adding/Changing:**

| Change | Pages to Update |
|--------|----------------|
| **New Profile** | `implementation.md`, `dependency-table.md`, `globals-table.md` |
| **New Example** | `examples.md`, `downloads.md` |
| **New Extension** | `implementation.md`, `globals-table.md` |
| **New ValueSet/CodeSystem** | `implementation.md`, `dependency-table.md` |
| **Version Release** | `changes.md`, `cross-version-analysis.md`, `sushi-config.yaml` |
| **Dependency Changes** | `dependency-table.md`, `cross-version-analysis.md` |
| **Breaking Changes** | `changes.md`, `cross-version-analysis.md`, `implementation.md` |

#### 📄 **Page-Specific Update Guidelines:**

##### `changes.md` - Change Log
**Update when:**
- New version release
- Breaking changes
- New features added
- Bug fixes
- Dependency updates

**Format:**
```markdown
## Version X.Y.Z (Release Date)
### Added/Changed/Fixed/Removed
- Description of change
```

##### `examples.md` - Examples Overview  
**Update when:**
- Adding new example resources
- Changing example patterns
- Adding new workflow examples

**Include:**
- Links to all examples
- Brief descriptions
- Usage patterns
- Implementation notes

##### `downloads.md` - Downloads Page
**Update when:**
- Adding new resources
- Creating new bundles
- Updating Postman collection
- Adding new download formats

**Maintain:**
- Links to all JSON resources
- Bundle downloads
- Postman collection link
- Package download

##### `implementation.md` - Implementation Guide
**Update when:**
- Adding new profiles
- Changing patterns
- Updating dependencies
- Adding conformance requirements

**Include:**
- Architecture overview
- Profile descriptions  
- Implementation steps
- Conformance requirements

##### `dependency-table.md` - Dependency Table
**Update when:**
- Changing FHIR version
- Updating SDC version
- Adding new dependencies
- Removing dependencies

**Maintain:**
- Version compatibility matrix
- Installation requirements
- Known issues

##### `cross-version-analysis.md` - Version Analysis
**Update when:**
- Creating new versions
- Breaking changes
- Migration paths change

**Include:**
- Compatibility matrix
- Migration guidance
- Breaking changes list

##### `globals-table.md` - Globals Overview
**Update when:**
- Adding global profiles
- Changing naming patterns
- Adding global constraints
- Updating URL patterns

### 🆕 Adding New Content

#### Adding a New Profile
1. **Create FSH file** in `input/fsh/profiles/`
2. **Add alias** to `input/fsh/Alias.fsh` if needed
3. **Update pages:**
   - `implementation.md` - Add profile description
   - `dependency-table.md` - Add if it uses new dependencies
   - `globals-table.md` - Add if it's globally assigned
4. **Create example** in `input/fsh/examples/`
5. **Update `examples.md`** with new example
6. **Build and validate**

#### Adding a New Example
1. **Create FSH file** in appropriate `input/fsh/examples/` subfolder
2. **Update `examples.md`** with description and link
3. **Update `downloads.md`** with download link
4. **Test validation**
5. **Regenerate Postman collection**

#### Adding a New Page
1. **Create markdown file** in `input/pagecontent/`
2. **Update `sushi-config.yaml`** pages section
3. **Update menu** in `sushi-config.yaml`
4. **Link from other relevant pages**

### 🔧 Postman Collection

#### Regenerating the Collection
```bash
cd scripts/
node generate-postman-collection.js
```

**Update when:**
- Adding new resources
- Changing resource structure
- Adding new endpoints
- Updating workflow examples

#### Customizing the Collection
Edit `scripts/generate-postman-collection.js` to:
- Add new workflow examples
- Modify request templates
- Update base URLs
- Add authentication

### 📋 Release Checklist

#### Before Release
- [ ] Update `sushi-config.yaml` version
- [ ] Update `changes.md` with all changes
- [ ] Update `cross-version-analysis.md` if breaking changes
- [ ] Regenerate Postman collection
- [ ] Run full build: `./_genonce.sh`
- [ ] Check `output/qa.html` for validation issues
- [ ] Test examples validate correctly
- [ ] Update any documentation that references version numbers

#### During Release
- [ ] Tag release in git
- [ ] Update published IG URL if changed
- [ ] Generate release package
- [ ] Update GitHub Pages deployment

#### After Release
- [ ] Update `dependency-table.md` with new version info
- [ ] Create next version planning in `changes.md`

### 🚨 Common Maintenance Tasks

#### Fixing Validation Errors
1. **Check `output/qa.txt`** for specific errors
2. **Update FSH files** to fix issues
3. **Rebuild**: `sushi build .`
4. **Re-validate**: `./_genonce.sh`
5. **Document fixes** in `changes.md` if significant

#### Updating Dependencies
1. **Update `sushi-config.yaml`** dependencies section
2. **Test build** to ensure compatibility
3. **Update `dependency-table.md`** with new versions
4. **Update `cross-version-analysis.md`** with compatibility info
5. **Document changes** in `changes.md`

#### Adding Missing Examples
1. **Check warnings** in `output/qa.html` for "no examples" messages
2. **Create example FSH files** for flagged profiles
3. **Update `examples.md`** with descriptions
4. **Update `downloads.md`** with links

### 📞 Support

#### For Technical Issues
- Check `CLAUDE.md` for Claude Code specific guidance
- Review `output/qa.html` for validation issues
- Check GitHub Issues for known problems

#### For Content Questions  
- Review published IG at [https://joelpettis.github.io/eFormsIG/](https://joelpettis.github.io/eFormsIG/)
- Check `implementation.md` for usage guidance
- Review examples in `examples.md`

## 📜 License

This Implementation Guide is licensed under Creative Commons "No Rights Reserved" (CC0).

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes following the maintainer guidelines above
4. Update relevant documentation pages
5. Test your build
6. Submit a pull request

---

**Last Updated**: July 2025  
**Current Version**: 0.1.0  
**FHIR Version**: R4.0.1  
**SDC Version**: 3.0.0