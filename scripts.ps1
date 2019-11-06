
terraform.exe init

terraform.exe plan `
    -var group="teachers" `
    -var access_key="3fff6a33-2e76-42f7-a7d9-164829d4eb52" `
    -var access_key="c1df6dbd-fa3d-466a-ab34-e9a66920b360"

terraform.exe apply `
    -var group="teachers" `
    -var access_key="3fff6a33-2e76-42f7-a7d9-164829d4eb52" `
    -var access_key="c1df6dbd-fa3d-466a-ab34-e9a66920b360"
