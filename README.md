[![Community Project header](https://res.cloudinary.com/enter-at/image/upload/v1576145406/static/logo-svg.svg)]

# New Relic CloudWatch Logs ingestion

AWS Serverless application that sends log data from CloudWatch Logs to New Relic.

## Requirements

To forward data to New Relic you need a [New Relic License Key](https://docs.newrelic.com/docs/accounts/install-new-relic/account-setup/license-key).

## Install and configure

To install and configure the New Relic Cloudwatch Logs Lambda, [see newrelic documentation](https://docs.newrelic.com/docs/logs/enable-logs/enable-logs/aws-cloudwatch-plugin-logs).

Additional notes:

* Some users in UTF-8 environments have reported difficulty with defining strings of `NR_TAGS` delimited by the semicolon `;` character. If this applies to you, you can set an alternative delimiter character as the value of `NR_ENV_DELIMITER`, and separate your `NR_TAGS` with that.
* Custom Lambda and VPC log groups can be set using the `NR_LAMBDA_LOG_GROUP_PREFIX` and `NR_VPC_LOG_GROUP_PREFIX` environment variables.

### Terraform

In your Terraform, you can add this as a module, replacing `{{YOUR_LICENSE_KEY}}` with your New Relic License Key.

```terraform
module "newrelic_log_ingestion" {
  source             = "github.com/newrelic/aws-log-ingestion"
  nr_license_key     = "{{YOUR_LICENSE_KEY}}"
}
```

By default, this will build and pack the lambda zip inside of the Terraform Module. You can supply your own by switching `build_lambda = false`, and specify the path to your lambda, using `lambda_archive = "{{LAMBDA_PATH}}"`, replacing `{{LAMBDA_PATH}}` with the path to your lambda.