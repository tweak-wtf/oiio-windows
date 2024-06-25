FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2022 AS ci-windows-conan

SHELL ["powershell.exe", "-ExecutionPolicy", "Bypass", "-Command"]

# install chocolatey
RUN iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install dependencies with chocolatey
RUN choco install --no-progress --yes python3 --version=3.9
RUN choco install --no-progress --yes visualstudio2022buildtools
RUN choco install --no-progress --yes visualstudio2022-workload-vctools
RUN choco install --no-progress --yes visualstudio2022-workload-manageddesktop
RUN choco install --no-progress --yes git
RUN choco install --no-progress --yes cmake --installargs "ADD_CMAKE_TO_PATH=System"
RUN choco install --no-progress --yes conan


# conan profile detect --force
# conan install --requires openimageio/2.5.12.0 -g CMakeDeps -g CMakeToolchain
# conan cache path openimageio/2.5.12.0

# SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
CMD while ($true) { Start-Sleep -Seconds 60 }
