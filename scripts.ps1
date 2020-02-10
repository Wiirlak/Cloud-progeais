
terraform.exe init `
    azure-terraform

terraform.exe plan `
    -var tenant_id="468baace-a6c5-46f4-832d-417248f38f5e" `
    -var subscription_id="3b714193-8ac6-46be-87db-d6140bfbf648" `
    -var client_id="c271cc62-8a9d-46ee-b2f2-222f2425bb9c" `
    -var client_secret="n5ycGwOnAjLdNSQwsXAe6YvzK/ibS9UL00QzTJtz128=" `
    azure-terraform

terraform.exe apply `
    -var tenant_id="468baace-a6c5-46f4-832d-417248f38f5e" `
    -var subscription_id="3b714193-8ac6-46be-87db-d6140bfbf648" `
    -var client_id="c271cc62-8a9d-46ee-b2f2-222f2425bb9c" `
    -var client_secret="n5ycGwOnAjLdNSQwsXAe6YvzK/ibS9UL00QzTJtz128=" `
    azure-terraform