#!/bin/bash

echo "-----------------"

echo "Full update"
apt update
apt full-upgrade -y

echo "-----------------"

echo "Install libraries"
apt install net-tools apache2 php7.4 libapache2-mod-php7.4 php7.4-common php7.4-mbstring php7.4-xmlrpc php7.4-soap php7.4-gd php7.4-xml php7.4-intl php7.4-mysql php7.4-cli php7.4-zip php7.4-curl mysql-client -y

echo "-----------------"

echo "Enable SSL"
a2enmod ssl
a2ensite default-ssl.conf

echo "-----------------"

echo "Create index.php"
cat > /var/www/html/index.php << 'EOF'
<?php
echo "
<html>
<head>
    <title>Test</title>
</head>
<body>
<h1>Test</h1>
</body>
</html>";
?>
EOF

echo "-----------------"

echo "Restart apache"
systemctl restart apache2.service

echo "------ END ------"
