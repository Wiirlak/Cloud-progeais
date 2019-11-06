cd D:\ESGI\Cloud\project\terraform-azure

.\terraform.exe init

.\terraform.exe plan `
    -var group="progeais" `
    -var tenant_id="468baace-a6c5-46f4-832d-417248f38f5e" `
    -var subscription_id="3b714193-8ac6-46be-87db-d6140bfbf648" `
    -var client_id="931eaf6d-ba15-4802-9b9a-f7cfff1f086f" `
    -var client_secret="esgi2019_@l!"
