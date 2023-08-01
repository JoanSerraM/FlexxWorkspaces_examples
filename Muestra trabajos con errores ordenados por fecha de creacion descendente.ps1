$api_url = 'https://fws-apim-93768.azure-api.net/api/'  # URL de la FWSAPI

# Token en formato Basic
$token = 'Basic NzkwODhkMzktNDE2ZC00ZTlmLTg4M2EtYTc4M2RhMzM4ODQwOm1oelNQRVQ0V3AxRmJ0Mip0OXVUckU1bkw='

$headers = @{
    'Content-Type' = 'application/json'
    'Authorization' = $token
}

$url = $api_url + 'jobs?filter=startswith(Status,"Error")&orderby=CreationDate desc&apiversion=1'  # Endpoint de la API con filtro aplicado

$response = $null
$result = $null

try {
    $response = Invoke-RestMethod -Uri $url -Headers $headers -Method Get
    $result = $response | ConvertTo-Json
}
catch {
    throw $_.Exception.Message
}

# Mostrar la respuesta en pantalla
$result | Format-Table
