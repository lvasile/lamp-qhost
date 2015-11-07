echo "Name of site: ex. test.localhost.dev"
read site
# we write to hosts our site
sudo printf '%s\n' $site >> /etc/hosts
echo "Enter the directory name for $site :"
read directory
mkdir "/var/www/html/subdomains/$directory"
echo "Enter the document root from $directory /"
read documentroot
# and we make a conf to apache2
sudo printf '%s\n' "<VirtualHost *:80>" "ServerName $site" "ServerAlias www.$site"	"DocumentRoot /var/www/html/subdomains/${directory}/${documentroot}" "ErrorLog \${APACHE_LOG_DIR}/${directory}.log" "</VirtualHost>" >> "/etc/apache2/sites-available/${directory}.conf"
sudo a2ensite $directory
sudo service apache2 restart
xdg-open "/var/www/html/subdomains/${directory}"
