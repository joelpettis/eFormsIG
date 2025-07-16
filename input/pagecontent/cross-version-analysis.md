# Cross-Version Analysis

This page provides analysis of changes and compatibility across different versions of the Ontario Health eForms Implementation Guide.

## Version Comparison

**Current Version: 0.1.0**
- **Status**: Draft/CI Build  
- **Release Date**: July 2025
- **FHIR Version**: R4.0.1
- **SDC Version**: 3.0.0

## Dependencies Analysis

**FHIR Specification**
- **Current**: FHIR R4.0.1 (4.0.1)
- **Compatibility**: Backward compatible with R4.0.0

**SDC Implementation Guide**
- **Current**: SDC 3.0.0
- **Previous**: SDC 4.0.0-ballot (development phase)
- **Migration**: Successfully migrated with feature preservation

## Breaking Changes

### From Development (SDC 4.0.0-ballot) to Current (SDC 3.0.0)

**Removed Extensions**
- `versionAlgorithm` extension - Not available in SDC 3.0.0
- `copyrightLabel` extension - Not available in SDC 3.0.0
- `hidden` item extension - Not available in SDC 3.0.0
- `answerConstraint` item extension - Not available in SDC 3.0.0

**Preserved Functionality**
- ✅ Modular forms using `sdc-questionnaire-subQuestionnaire`
- ✅ Assembly expectations using `assemble-expectation`
- ✅ Task-based workflow patterns
- ✅ All core profiles and structure definitions

## Forward Compatibility

**Planned Changes for Version 0.2.0**
- **Addition**: More comprehensive examples
- **Addition**: Postman collection
- **Addition**: Implementation guidance
- **Impact**: Non-breaking additions only

**Future FHIR Versions**  
This IG is designed to be forward-compatible with:
- **FHIR R4.3+** - Expected minimal migration effort
- **FHIR R5** - May require updates to leverage new capabilities

## Implementation Impact

### Upgrade Path from SDC 4.0.0-ballot
If you were using an early development version:

1. **Remove unsupported extensions**:
   - Remove any use of `versionAlgorithm` extension
   - Remove `copyrightLabel` constraints
   - Remove `hidden` and `answerConstraint` item extensions

2. **Verify core functionality**:
   - ✅ Sub-questionnaire references still work
   - ✅ Assembly expectations unchanged
   - ✅ Task workflow patterns preserved

3. **Update dependencies**:
   - Change SDC dependency from `4.0.0-ballot` to `3.0.0`
   - Remove R5 extension dependencies

### No Impact Areas
- Core questionnaire structure
- Task-based workflows
- ServiceRequest patterns
- Business status extensions
- Value sets and code systems

## Compatibility Matrix

| Feature | SDC 3.0.0 | SDC 4.0.0-ballot | Notes |
|---------|-----------|------------------|-------|
| Sub-questionnaires | ✅ | ✅ | Fully compatible |
| Assembly expectation | ✅ | ✅ | Fully compatible |
| Task workflows | ✅ | ✅ | Fully compatible |
| Version algorithm | ❌ | ✅ | Removed in 3.0.0 |
| Copyright labels | ❌ | ✅ | Removed in 3.0.0 |
| Hidden items | ❌ | ✅ | Removed in 3.0.0 |
| Answer constraints | ❌ | ✅ | Removed in 3.0.0 |

## Testing Recommendations

**Regression Testing**  
When upgrading, test:
1. **Questionnaire assembly** - Verify sub-questionnaires load correctly
2. **Workflow progression** - Verify task status transitions work
3. **Data capture** - Verify QuestionnaireResponse validation
4. **Business logic** - Verify custom business status handling

**Validation**  
Run validation against:
- FHIR R4.0.1 core specification
- SDC 3.0.0 profiles
- This IG's custom profiles

---

*This analysis will be updated with each new version release.*