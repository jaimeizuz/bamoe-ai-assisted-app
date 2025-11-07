param($registryUser,$imagePush,$imageRegistry,$imageGroup);

$params="`"-Pcontainer`""

if ($null -ne $imageRegistry) {
    $params = "$($params) `"-Dimage.registry=$($imageRegistry)`""
}

if ($null -ne $imageGroup) {
    $params = "$($params) `"-Dimage.group=$($imageGroup)`""
}

if ($null -ne $imagePush) {
    $params = "$($params) `"-Dimage.push=$($imagePush)`""
}

Write-Host "Build params: $params"

if ($null -ne $registryUser) {
    Invoke-Expression "& docker login -u $registryUser"
}

Invoke-Expression "& mvn $params clean package"