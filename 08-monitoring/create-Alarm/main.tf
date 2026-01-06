# Step 1: Create CloudWatch alarm for EC2 CPU utilization
resource "aws_cloudwatch_metric_alarm" "datacenter_alarm" {
  alarm_name          = "datacenter-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "Alarm when EC2 CPU utilization exceeds 80%"
  
  dimensions = {
    InstanceId = "i-xxxxxxxxxxxxxxxxx"
  }
}

# ---------------------------------------------------
# Task Description:
# Create a CloudWatch alarm using Terraform with the
# following requirements:
#
# - Alarm name must be "datacenter-alarm"
# - Monitor EC2 CPU utilization
# - Trigger when CPU utilization exceeds 80%
# - Evaluation period must be 5 minutes (300 seconds)
# - Use a single evaluation period
# ---------------------------------------------------

