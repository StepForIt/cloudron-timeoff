# TimeOff Management

A simple and efficient leave management application, deployable on Cloudron.

## Prerequisites

- A Cloudron instance
- Local storage (automatically provided via Cloudron addons)

## Local Development

The application can be developed locally using Docker Compose:

```bash
task compose:build    # Build services
task compose:up       # Start services
task compose:logs     # Display logs
task compose:down     # Stop services
```

Or simply:

```bash
task dev              # Start development environment
task dev-down         # Stop development environment
```

## Installation on Cloudron

The application can be installed directly from the Cloudron App Store or via Task commands:

```bash
task cloudron:login    # Login to Cloudron
task cloudron:build    # Build package
task cloudron:install  # Install application
task cloudron:reinstall # Reinstall application
task cloudron:remove   # Remove application
```

## Update

To update the application:

```bash
task cloudron:update
```

## Support

To view application logs:

```bash
task cloudron:logs
```