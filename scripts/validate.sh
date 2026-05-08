#!/bin/bash

terraform fmt -recursive
terraform validate
tflint
