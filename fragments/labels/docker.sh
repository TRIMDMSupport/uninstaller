docker)
      appTitle="Docker Desktop"
      appProcesses+=("Docker")
      appProcesses+=("Docker Desktop")
      appProcesses+=("com.docker.hyperkit")
      appFiles+=("/Applications/Docker.app")
      appFiles+=("<<Users>>/Library/Application Scripts/com.docker.helper")
      appFiles+=("<<Users>>/Library/Caches/com.docker.docker")
      appFiles+=("<<Users>>/Library/Containers/com.docker.docker")
      appFiles+=("<<Users>>/Library/Containers/com.docker.helper")
      appFiles+=("/Library/PrivilegedHelperTools/com.docker.socket")
      appFiles+=("/Library/PrivilegedHelperTools/com.docker.vmnetd")
      appFiles+=("<<Users>>/.docker")
      appFiles+=("<<Users>>/Library/Application Support/Docker Desktop")
      appFiles+=("<<Users>>/Library/Preferences/com.docker.docker.plist")
      appFiles+=("<<Users>>/Library/Saved Application State/com.electron.docker-frontend.savedState")
      appFiles+=("<<Users>>/Library/Group Containers/group.com.docker")
      appFiles+=("<<Users>>/Library/Group Containers/group.com.docker/http_proxy.json:")
      appFiles+=("<<Users>>/Library/Logs/Docker Desktop")
      appFiles+=("<<Users>>/Library/Preferences/com.electron.docker-frontend.plist")
      appFiles+=("<<Users>>/Library/Cookies/com.docker.docker.binarycookies")
      appFiles+=("/usr/local/lib/docker")
      appFiles+=("/usr/local/bin/docker-machine")
      appFiles+=("/usr/local/bin/docker-compose")
      appFiles+=("/usr/local/bin/docker-credential-osxkeychain")
      appFiles+=("/usr/local/lib/docker")
      appLaunchAgents+=("/Library/LaunchDaemons/com.docker.vmnetd.plist")
      appLaunchAgents+=("/Library/LaunchDaemons/com.docker.socket.plist")
      preflightCommand+=("/Applications/Docker.app/Contents/MacOS/uninstall")
      ;;
