Connect-MgGraph -Scope "Application.ReadWrite.All"

#app obj id
$applicationId = "6b08a1b3-109f-4f12-a174-6b92c139d318"

#Schema used https://learn.microsoft.com/en-us/graph/api/resources/approle?view=graph-rest-1.0
{
  "allowedMemberTypes": ["String"],
  "description": "String",
  "displayName": "String",
  "id": "Guid",
  "isEnabled": true,
  "origin": "String",
  "value": "String"
}

#To update it https://learn.microsoft.com/en-us/graph/api/resources/application?view=graph-rest-1.0

#when updating need to include the old app roles

$params = @{
	appRoles = @{
                    allowedMemberTypes = "User", "Application"
                    description = "Allows users and groups to create groups"
                    displayName = "CreateGroup"
                    id = "3c254c50-43f0-4806-b971-f5d88065f9de"
                    isEnabled = $true
                    value = "CreateGroup"
                },
               @{
                    allowedMemberTypes = "User", "Application"
                    description = "Allows users and groups to create apps"
                    displayName = "CreateApps"
                    id = "125e7662-2df6-4407-8ad0-82500929b71d"
                    isEnabled = $true
                    value = "CreateApps"
               },
               @{
                    allowedMemberTypes = "User"
                    description = "Allows Users and groups to create user"
                    displayName = "CreateUsers"
                    id = "d946cf02-fd63-4837-9f96-e5205b430312"
                    isEnabled = $true
                    value = "CreateUsers"
               },
               @{
                    allowedMemberTypes = "User"
                    description = "this is a test to Test Create App Role"
                    displayName = "TestAppRole"
                    id = $newGuid
                    isEnabled = $true
                    value = "TestAppRole"
               }
}

Update-MgApplication -ApplicationId $applicationId -BodyParameter $params

get-MgApplication -ApplicationId $applicationId


$newGuid = [guid]::NewGuid()