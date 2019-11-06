
terraform.exe init

terraform.exe plan `
    -var group="teachers" `
    -var access_key="d12771c6-5637-46d3-8736-e956252af08a" `
    -var access_key="c1df6dbd-fa3d-466a-ab34-e9a66920b360"

terraform.exe apply `
    -var group="teachers" `
    -var access_key="d12771c6-5637-46d3-8736-e956252af08a" `
    -var access_key="c1df6dbd-fa3d-466a-ab34-e9a66920b360"
