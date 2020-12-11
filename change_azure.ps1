#Load Azure Module
Import-Module AzureRM

[string]$STORAGE_NAME = ''
[string]$STORAGE_ACCESS_KEY = ''
[string]$STORAGE_CONTAINER = ''

$AZURE_CONNECTION = New-AzureStorageContext -StorageAccountName $STORAGE_NAME -StorageAccountKey $STORAGE_ACCESS_KEY

Connect-AzureRmAccount

$STORAGE_BLOB = Get-AzureStorageBlob -Container $STORAGE_CONTAINER -Context $AZURE_CONNECTION

foreach($BLOB in $STORAGE_BLOB){
    $BLOB.ICloudBlob.SetStandardBlobTier("Archive")
}
