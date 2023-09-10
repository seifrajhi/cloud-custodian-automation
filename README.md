# Cloud Custodian terraform project 

For a dry run:

- manheim-c7n-runner -c accounts-config.yml --step=policygen --step=validate --step=mailer --step=custodian --step=mugc --step=dryrun-diff --step=s3archiver dryrun $ENV

- markdown-code-blocks-highlight pr_diff.md > policies_diff.html

If results are ok you can run using:

- manheim-c7n-runner -c accounts-config.yml --step=policygen --step=validate --step=mailer --step=custodian --step=mugc --step=s3archiver run $ENV

