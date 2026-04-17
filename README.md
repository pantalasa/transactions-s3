# transactions-s3

Reusable Terraform module that provisions an S3 bucket configured for transaction data storage.

## Features

- Versioning enabled
- KMS-based server-side encryption
- Public access fully blocked
- Lifecycle rules (IA after 30 days, Glacier after 90)

## Intentional omissions

This module does **not** set `lifecycle { prevent_destroy = true }`. That choice is deferred
to the consumer, who knows whether this bucket is production-critical (SOC2-scoped) or a
throwaway environment.

Consumers in compliance-scoped contexts MUST either:

1. Wrap the module and set `prevent_destroy` themselves, or
2. File an issue with this library to opt-in bucket-level delete protection.

## Usage

```hcl
module "transactions" {
  source      = "git::ssh://git@github.com/pantalasa/transactions-s3.git//terraform?ref=v1.0.0"
  name_prefix = "my-service"
  tags = {
    Service     = "my-service"
    Environment = "production"
  }
}
```

## Versioning

Consumers should pin to a tagged version (e.g. `ref=v1.0.0`) for reproducible builds.
