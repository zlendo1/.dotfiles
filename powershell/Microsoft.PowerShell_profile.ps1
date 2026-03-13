# PATH — portable tools
$env:PATH = "$env:USERPROFILE\tools\nvim\bin;" +
            "$env:USERPROFILE\tools\pwsh;" +
            "$env:USERPROFILE\tools\fzf;" +
            "$env:USERPROFILE\tools\lazygit;" +
            "$env:USERPROFILE\tools\lazydocker;" +
            "$env:USERPROFILE\tools\oh-my-posh;" +
            $env:PATH

# Editor
$env:EDITOR = "nvim"

# Aliases
Set-Alias -Name vi   -Value nvim
Set-Alias -Name vim  -Value nvim
Set-Alias -Name lg   -Value lazygit
Set-Alias -Name ldo  -Value lazydocker

# inv: fuzzy-find files and open in nvim (replicates zsh inv alias)
function inv {
    $files = fzf --multi --preview "nvim --headless -c 'set number' -c 'syntax on' {}"
    if ($files) {
        nvim $files
    }
}

# PSReadLine — vi mode, history, suggestions
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -MaximumHistoryCount 10000
Set-PSReadLineOption -PredictionSource History

# Key bindings
Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -Function AcceptSuggestion
Set-PSReadLineKeyHandler -Chord 'Ctrl+p' -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord 'Ctrl+n' -Function HistorySearchForward

# fzf integration (requires PSFzf module — install once: Install-Module PSFzf -Scope CurrentUser)
if (Get-Module -ListAvailable -Name PSFzf) {
    Import-Module PSFzf
    Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
}

# oh-my-posh prompt (same powerchad.toml as Linux)
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    oh-my-posh init pwsh --config "$env:USERPROFILE\.config\ohmyposh\powerchad.toml" | Invoke-Expression
}
