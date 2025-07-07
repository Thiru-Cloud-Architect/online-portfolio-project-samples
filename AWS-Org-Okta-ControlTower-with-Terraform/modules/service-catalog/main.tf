resource "aws_servicecatalog_portfolio" "account_vending" {
  name          = "Control Tower Account Factory"
  description   = "Service Catalog for vending new AWS accounts"
  provider_name = "AWS Control Tower"
}

resource "aws_servicecatalog_principal_portfolio_association" "association" {
  portfolio_id = aws_servicecatalog_portfolio.account_vending.id
  principal_arn = data.aws_caller_identity.current.arn
  principal_type = "IAM"
}

# Placeholder for Account Factory Product
# This is typically managed by Control Tower, so it is referenced, not recreated.
data "aws_servicecatalog_product" "account_factory" {
  name = "AWS Control Tower Account Factory"
  id = aws_servicecatalog_portfolio.account_vending.id
}

resource "aws_servicecatalog_provisioning_artifact" "artifact" {
  product_id = data.aws_servicecatalog_product.account_factory.id
}

data "aws_caller_identity" "current" {}
