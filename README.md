# checkov-iam-lockdown 
Collection of custom checkov policies to prevent IAM changes via Terraform

## Getting started
1. Download checkov

    `pip3 install checkov`

2. Clone this repository (optional)

    `git clone https://github.com/tmprender/checkov-iam-lockdown`

3. Run checkov using custom policies

    `checkov -d example/ --external-checks-dir checkov-iam-lockdown/gcp`

    or reference git repo directly...

    `checkov -d example/ --external-checks-git https://github.com/tmprender/checkov-iam-lockdown/aws`

## Next steps
Configure separate pipeline to manage IAM changes.