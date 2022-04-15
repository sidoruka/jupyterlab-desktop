# Download
Invoke-WebRequest -Uri https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Windows-x86_64.exe -OutFile Miniforge3-Windows-x86_64.exe
.\Miniforge3-Windows-x86_64.exe
conda install -y -c conda-forge constructor
conda install -y -c conda-forge nodejs
Invoke-WebRequest -Uri https://github.com/sidoruka/jupyterlab-desktop/archive/refs/heads/master.zip -OutFile master.zip
Expand-Archive -Path master.zip -DestinationPath .\jupyterlab-desktop
cd jupyterlab-desktop\jupyterlab-desktop-master
npm install --global yarn
yarn
yarn run clean
yarn build
yarn create_env_installer:win
yarn dist:win

pip install awscli
cd dist
aws s3 cp JupyterLab-Setup.exe s3://cloud-pipeline-oss-builds/tools/jupyterlab-desktop/JupyterLab-Setup.exe

# JLAB_DESKTOP_CONFIG_DIR
# JLAB_STATE_DB_DIR
