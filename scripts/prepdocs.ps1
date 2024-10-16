./scripts/load_python_env.ps1

$venvPythonPath = "./.venv/scripts/python.exe"
if (Test-Path -Path "/usr") {
  # fallback to Linux venv path
  $venvPythonPath = "./.venv/bin/python"
}

Write-Host 'Running "prepdocs.py"'


$cwd = (Get-Location)
$dataArg = "`"$cwd/data/*`""
$additionalArgs = ""
if ($args) {
  $additionalArgs = "$args"
}

$argumentList = "./app/backend/prepdocs.py $dataArg --verbose $additionalArgs"

$argumentList

Start-Process -FilePath $venvPythonPath -ArgumentList $argumentList -Wait -NoNewWindow

# caricamento con aggiunta di categoria per tutti i documenti presenti
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --category SeniorArchitect --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaihost $env:OPENAI_HOST --openaiservice $env:AZURE_OPENAI_SERVICE --openaikey `"$env:OPENAI_API_KEY`" --openaiorg `"$env:OPENAI_ORGANIZATION`" --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID -v" -Wait -NoNewWindow

# cancellazione di tutti i documenti
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --removeall --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaihost $env:OPENAI_HOST --openaiservice $env:AZURE_OPENAI_SERVICE --openaikey `"$env:OPENAI_API_KEY`" --openaiorg `"$env:OPENAI_ORGANIZATION`" --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID -v" -Wait -NoNewWindow

# caricamento con skip del salvataggio file su blobstorage (vengono comunque indicizzati)
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --skipblobs --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaihost $env:OPENAI_HOST --openaiservice $env:AZURE_OPENAI_SERVICE --openaikey `"$env:OPENAI_API_KEY`" --openaiorg `"$env:OPENAI_ORGANIZATION`" --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID -v" -Wait -NoNewWindow

# cancellazione di tutti e soli i singoli file presenti nella cartella data
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --remove --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaihost $env:OPENAI_HOST --openaiservice $env:AZURE_OPENAI_SERVICE --openaikey `"$env:OPENAI_API_KEY`" --openaiorg `"$env:OPENAI_ORGANIZATION`" --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID -v" -Wait -NoNewWindow

