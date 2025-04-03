# Get the current script path
$script_path = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Path where the installer is located (in the same folder as the script)
$setup_path = "$script_path\SQLServerReportingServices.exe"

# Path where SSRS will be installed
$install_folder = "$script_path\SQLServerReportingServices"

# Create the folder if it does not exist
if (!(Test-Path -Path $install_folder)) {
    New-Item -ItemType Directory -Path $install_folder | Out-Null
}

# Define installation arguments
$installArgs = ""
$installArgs += " /quiet"  # Silent installation without interface
$installArgs += " /log `"$script_path\ssrs-install-log.txt`""  # Log file in the same folder
$installArgs += " /InstallFolder=`"$install_folder`""  # Install in the same folder
$installArgs += " /IAcceptLicenseTerms"  # Accept terms
# $installArgs += " /PID=XXXX-XXXX-XXXX-XXXX"  # Replace with your product key if necessary

# Run the installer
Start-Process -FilePath $setup_path -ArgumentList $installArgs -Wait
