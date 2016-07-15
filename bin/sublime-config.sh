#!/usr/bin/env bash

INSTALLDIR="$HOME/Library/Application Support/Sublime Text 3/Installed Packages"
PACKAGEDIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
curl https://packagecontrol.io/Package%20Control.sublime-package -o "$INSTALLDIR/Package Control.sublime-package"

echo '{
  "bootstrapped": true,
  "in_process_packages":
  [
  ],
  "installed_packages":
  [
    "All Autocomplete",
    "BeautifyRuby",
    "ChangeQuotes",
    "Dockerfile Syntax Highlighting",
    "Evernote",
    "Git",
    "GitGutter",
    "MarkdownEditing",
    "Markdown Preview",
    "Package Control",
    "Pretty JSON",
    "Puppet",
    "RuboCop",
    "RubyTest",
    "SideBarEnhancements",
    "SublimeLinter",
    "SublimeLinter-contrib-reek",
    "SublimeLinter-json",
    "SublimeLinter-rubocop",
    "SublimeLinter-ruby",
    "SublimeLinter-contrib-puppet",
    "SublimeLinter-contrib-puppet-lint",
    "Terraform"
  ]
}' > "$INSTALLDIR/Package Control.sublime-settings"

echo '{
  "bold_folder_labels": true,
  "color_scheme": "Packages/User/SublimeLinter/Monokai (SL).tmTheme",
  "ensure_newline_at_eof_on_save": true,
  "font_size": 17,
  "highlight_modified_tabs": true,
  "ignored_packages":
  [
    "Vintage"
  ],
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "trim_trailing_white_space_on_save": true
}' > "$PACKAGEDIR/Preferences.sublime-settings"
