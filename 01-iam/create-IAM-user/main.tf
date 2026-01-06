# Step 1: Create IAM user
resource "aws_iam_user" "iam_user" {
  name = "iamuser_james"
}

# ---------------------------------------------------
# Task Description:
# Use Terraform to create an IAM user with the
# following requirement:
#
# - IAM user name must be "iamuser_james"
# ---------------------------------------------------

