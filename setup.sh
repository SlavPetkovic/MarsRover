#!/bin/bash

# Function to update and upgrade the system
update_system() {
    echo "---------------------------------------------------------"
    echo "--------------Initial System Update and Upgrade----------"
    echo "---------------------------------------------------------"
    sudo apt-get update && sudo apt-get -y upgrade
    sudo apt install -y git dkms
}

# Function to install Python packages
install_python_packages() {
    echo "---------------------------------------------------------"
    echo "---------------Installing global python packages---------"
    echo "---------------------------------------------------------"
    sudo apt-get install -y python3-pip
    sudo apt install -y python3-venv

}

## Function to install Visual Studio Code
#install_vscode() {
#    echo "---------------------------------------------------------"
#    echo "---------------Installing Visual Studio Code-------------"
#    echo "---------------------------------------------------------"
#    local vscode_version="latest"
#    wget -N -O vscode-linux-deb.arm64.deb "https://update.code.visualstudio.com/$vscode_version/linux-deb-arm64/stable"
#    sudo apt install -y ./vscode-linux-deb.arm64.deb
#    code --install-extension ms-python.python --force
#}

# Function to set up the testing project
setup_testing_project() {
    echo "---------------------------------------------------------"
    echo "---------------Setting Up The Testing Project------------"
    echo "---------------------------------------------------------"

    local project_dir="Projects/Testing"

    # Check if the project directory already exists
    if [ -d "$project_dir" ]; then
        echo "Project directory '$project_dir' already exists. Skipping cloning."
    else
        # Create 'Projects' directory if it doesn't exist and clone the repository
        mkdir -p Projects
        cd Projects || exit
        git clone https://github.com/SlavPetkovic/MarsRover
        cd MarsRover || exit
    fi
}

# Function to set up virtual environment
setup_virtual_env() {
    echo "--------------------------------------------------------"
    echo "---------------Setting up virtual env-------------------"
    echo "--------------------------------------------------------"
    python3 -m venv rover
    source rover/bin/activate
    curver=$(pip3 -V)
    echo "$curver"
}

# Function to install Python project packages
install_project_packages() {
    echo "--------------------------------------------------------"
    echo "---------------Installing Python Packages---------------"
    echo "--------------------------------------------------------"
    pip3 install -r requirements.txt
}

# Main script execution
display_banner
sleep 2
update_system
sleep 2
install_wifi_drivers
sleep 2
install_python_packages
sleep 2
install_vscode
sleep 2
setup_testing_project
sleep 2
setup_virtual_env
sleep 2
install_project_packages
sleep 2

# Script Footer
echo "--------------------------------------------------------------"
echo "COPYRIGHT: Slav Petkovic"
echo "Year: 2024"
