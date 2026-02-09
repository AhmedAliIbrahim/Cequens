# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Support for Ruby 4.x (core functionality only)
- CI/CD testing for Ruby versions 3.0, 3.1, 3.2, 3.3, and 4.0
- LICENSE file (MIT)
- CHANGELOG.md

### Changed
- Updated required Ruby version to support both Ruby 3.x and 4.x
- Updated GitHub Actions to use checkout@v4
- Updated RuboCop target Ruby version to 3.0
- Made Rails an optional dependency (only needed for the generator)
- Made generator gracefully handle absence of Rails

### Fixed
- Removed hard dependency on Rails (was breaking non-Rails usage)
- Fixed incorrect comment in Gemfile

### Notes
- Ruby 4.0 fully supported for all core functionality
- Rails generator works with any Ruby version when Rails is installed

## [0.1.2] - Previous Release

### Features
- Send SMS functionality
- Get SMS details functionality
- Configuration generator for Rails
- Response object with success checks
- Dry-validation contracts for request validation
