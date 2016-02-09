#!/bin/sh

echo "Running install.sh for $1"

# TODO: Download selected version via  (from docker-sho-manager) from githup.com/opencart/opencart and run installer

echo "Cloning opencart repository"
cloneCmd="git clone --branch $1 --depth 1 https://2245dfb67d208f3503081b38814bdd54e04368f7:x-oauth-basic@github.com/PrestaShop/PrestaShop.git /www"
eval cloneCmd

echo "Installing composer packages"
cd /www && composer.phar self-update && composer.phar config -g github-oauth.github.com 2245dfb67d208f3503081b38814bdd54e04368f7 && composer.phar install --ignore-platform-reqs

echo "Setting filesystem permissions"
chown -R www-data /www
chgrp -R www-data /www

echo "Installation completed"