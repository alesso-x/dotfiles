asdf plugin-add python
asdf plugin-add nodejs

# brew install gnupg
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

# zipimport.ZipImportError: can't decompress data; zlib not available
# sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
asdf install python 3.6.8 3.7.2
asdf install nodejs 10.15.0

asdf global python 3.6.8
asdf global nodejs 10.15.0
