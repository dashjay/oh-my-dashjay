#! /bin/zsh
# 跳过文件验证
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# 绕过第三方验证
sudo spctl --master-disable
defaults write com.apple.LaunchServices LSQuarantine -bool false

# 关闭文字更正
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# 双击标题栏加快zoom动画
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
