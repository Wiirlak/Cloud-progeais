cd D:\ESGI\Cloud\project\terraform-azure

.\terraform.exe init

.\terraform.exe plan `
    -var group="progeais" `
    -var tenant_id="468baace-a6c5-46f4-832d-417248f38f5e" `
    -var subscription_id="3b714193-8ac6-46be-87db-d6140bfbf648" `
    -var client_id="d12771c6-5637-46d3-8736-e956252af08a" `
    -var client_secret="Msk6C_v6R4Ya=Er8=rdaH-vDlZJc5lHX"

./terraform apply `
    -var group="progeais" `
    -var tenant_id="468baace-a6c5-46f4-832d-417248f38f5e" `
    -var subscription_id="3b714193-8ac6-46be-87db-d6140bfbf648" `
    -var client_id="d12771c6-5637-46d3-8736-e956252af08a" `
    -var client_secret="Msk6C_v6R4Ya=Er8=rdaH-vDlZJc5lHX"
