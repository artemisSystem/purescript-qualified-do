# Changelog

All notable changes to this project will (hopefully) be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [v2.1.0] - 2022-05-09

### Additions

- Added `QualifiedDo.ParOneOfMap`

## [v2.0.0] - 2022-05-09

### Breaking Changes

- Changed `QualifiedDo.(Semigroup|Alt|ParAlt)`'s `bind` to let you bind its
values to a variable instead of just returning `unit`.

### Additions

- Added `QualifiedDo.Semigroupoid`
- Added `QualifiedDo.FoldMap`
- Added `QualifiedDo.OneOfMap`
- Added `QualifiedDo.Unfoldable`

## [v1.0.0] - 2022-05-04

- Initial Release
