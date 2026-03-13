# .dotfiles

Configuration files for my development environment (Windows 11, native — no
WSL2, no admin required).

## Included Configs

- lazydocker
- lazygit
- mdformat
- nvim
- ohmyposh
- powershell
- vscode
- windowsterminal

## Windows Setup Guide

All tools are portable — no installer or admin privileges needed. Everything
lives under `%USERPROFILE%\tools\`.

### 1. Download portable tools

| Tool                                                                  | Download                                                                                                    | Extract to                                      |
| --------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | ----------------------------------------------- |
| Neovim                                                                | [GitHub Releases](https://github.com/neovim/neovim/releases) — `nvim-win64.zip`                             | `%USERPROFILE%\tools\nvim\`                     |
| PowerShell 7                                                          | [GitHub Releases](https://github.com/PowerShell/PowerShell/releases) — `PowerShell-*-win-x64.zip`           | `%USERPROFILE%\tools\pwsh\`                     |
| fzf                                                                   | [GitHub Releases](https://github.com/junegunn/fzf/releases) — `fzf-*-windows_amd64.zip`                     | `%USERPROFILE%\tools\fzf\`                      |
| lazygit                                                               | [GitHub Releases](https://github.com/jesseduffield/lazygit/releases) — `lazygit_*_Windows_x86_64.zip`       | `%USERPROFILE%\tools\lazygit\`                  |
| lazydocker                                                            | [GitHub Releases](https://github.com/jesseduffield/lazydocker/releases) — `lazydocker_*_Windows_x86_64.zip` | `%USERPROFILE%\tools\lazydocker\`               |
| oh-my-posh                                                            | [GitHub Releases](https://github.com/JanDeDobbeleer/oh-my-posh/releases) — `posh-windows-amd64.exe`         | `%USERPROFILE%\tools\oh-my-posh\oh-my-posh.exe` |
| [JetBrainsMonoNL Nerd Font](https://www.nerdfonts.com/font-downloads) | Download zip, extract, right-click `.ttf` → Install for all users                                           | system fonts                                    |

### 2. Apply configs

Copy or symlink each config directory to its Windows location:

| Config          | Source (this repo)                            | Windows destination                                                                        |
| --------------- | --------------------------------------------- | ------------------------------------------------------------------------------------------ |
| nvim            | `nvim/.config/nvim/`                          | `%LOCALAPPDATA%\nvim\`                                                                     |
| ohmyposh        | `ohmyposh/.config/ohmyposh/`                  | `%USERPROFILE%\.config\ohmyposh\`                                                          |
| powershell      | `powershell/Microsoft.PowerShell_profile.ps1` | `%USERPROFILE%\Documents\PowerShell\Microsoft.PowerShell_profile.ps1`                      |
| vscode          | `vscode/settings.json`                        | `%APPDATA%\Code\User\settings.json`                                                        |
| vscode          | `vscode/keybindings.json`                     | `%APPDATA%\Code\User\keybindings.json`                                                     |
| windowsterminal | `windowsterminal/settings.json`               | `%LOCALAPPDATA%\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json` |
| lazygit         | `lazygit/.config/lazygit/config.yml`          | `%APPDATA%\lazygit\config.yml`                                                             |
| lazydocker      | `lazydocker/.config/lazydocker/config.yml`    | `%APPDATA%\lazydocker\config.yml`                                                          |

> **Tip:** Use PowerShell `New-Item -ItemType SymbolicLink` to create symlinks
> instead of copying, so changes in the repo are picked up automatically.

### 3. Install VSCode extensions

Open VSCode and install:

- `asvetliakov.vscode-neovim` — embeds real Neovim inside VSCode
- `l-nafaryus.doom-one-theme` — Doom One colour theme
- `eamodio.gitlens` — GitLens

### 4. One-time PowerShell setup

```powershell
# Install PSFzf module for fzf integration
Install-Module PSFzf -Scope CurrentUser

# Allow profile scripts to run (run once, in a pwsh session)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### 5. nvim — first launch

On first launch, Lazy.nvim will automatically install all plugins. Mason will
prompt to install LSP servers — install the ones you need.

______________________________________________________________________

## Requirements

### nvim

- [JetBrainsMonoNL Nerd Font](https://www.nerdfonts.com/font-downloads) (also
  needed by Windows Terminal and VSCode)
- Neovim ≥ 0.10
