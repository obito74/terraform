provider "aws" {
    profile = "default"
}

resource "aws_instance" "name" {
    ami = "ami-07dff4fe919dee33e"
    instance_type = "t2.micro"
}
#TF_LOG=TRACE, DEGUB, INFO, WARN, or ERROR to change the verbosity of the logs.
#TRACE is the most verbose and it is the default if TF_LOG is set to something other than a log level name.
#To persist logged output you can set TF_LOG_PATH in order to force the log to always be appended to a specific file when logging is enabled.