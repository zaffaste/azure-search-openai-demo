. ./scripts/loadenv.ps1

$venvPythonPath = "./scripts/.venv/scripts/python.exe"
if (Test-Path -Path "/usr") {
  # fallback to Linux venv path
  $venvPythonPath = "./scripts/.venv/bin/python"
}

Write-Host 'Installing dependencies from "requirements.txt" into virtual environment'
Start-Process -FilePath $venvPythonPath -ArgumentList "-m pip install -r ./scripts/requirements.txt" -Wait -NoNewWindow

Write-Host 'Running "prepdocs.py"'
$cwd = (Get-Location)
# caricamento documenti standard con i documenti presenti nella cartella /data
Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaiservice $env:AZURE_OPENAI_SERVICE --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME -v" -Wait -NoNewWindow

# caricamento con aggiunta di categoria per tutti i documenti presenti
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --category SeniorArchitect --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaiservice $env:AZURE_OPENAI_SERVICE --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME -v" -Wait -NoNewWindow

# cancellazione di tutti i documenti
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --removeall --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaiservice $env:AZURE_OPENAI_SERVICE --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME -v" -Wait -NoNewWindow

# caricamento con skip del salvataggio file su blobstorage (vengono comunque indicizzati)
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --skipblobs --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaiservice $env:AZURE_OPENAI_SERVICE --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME -v" -Wait -NoNewWindow

# cancellazione di tutti e soli i singoli file presenti nella cartella data
# Start-Process -FilePath $venvPythonPath -ArgumentList "./scripts/prepdocs.py `"$cwd/data/*`" --remove --storageaccount $env:AZURE_STORAGE_ACCOUNT --container $env:AZURE_STORAGE_CONTAINER --searchservice $env:AZURE_SEARCH_SERVICE --openaiservice $env:AZURE_OPENAI_SERVICE --openaideployment $env:AZURE_OPENAI_EMB_DEPLOYMENT --index $env:AZURE_SEARCH_INDEX --formrecognizerservice $env:AZURE_FORMRECOGNIZER_SERVICE --tenantid $env:AZURE_TENANT_ID --openaimodelname $env:AZURE_OPENAI_EMB_MODEL_NAME -v" -Wait -NoNewWindow
