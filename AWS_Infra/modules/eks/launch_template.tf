resource "aws_launch_template" "node-template" {
  name = "${lookup(var.tagging,"env")}-eks-launch-template"
  key_name       = "jenkins-login"  # Specify your SSH key pair here

}