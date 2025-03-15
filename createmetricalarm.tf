resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "nandini_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "info-count1"
  namespace           = ": /moviedb-api/nandini"
  period              = 60  # 1 minutes
  statistic           = "Sum"
  threshold           = 80  # Trigger alarm if CPU usage is greater than 80%
  alarm_description   = "This metric monitors INFO count"

  # Specify the instance id for which the alarm is being set
  dimensions = {
    InstanceId = "i-0123456789abcdef0"
  }

  # Actions - You can define what to do when the alarm is triggered
  alarm_actions = [
    "arn:aws:sns:us-west-2:123456789012:MyTopic"  # SNS topic ARN
  ]
  
  ok_actions = [
    "arn:aws:sns:us-west-2:123456789012:MyTopic"  # Optional - Action when alarm goes back to OK
  ]

  insufficient_data_actions = [
    "arn:aws:sns:us-west-2:123456789012:MyTopic"  # Optional - Action when data is insufficient
  ]
}