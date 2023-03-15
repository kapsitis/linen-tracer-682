sudo ufw allow 5000
../eliozo-math-env/bin/uwsgi --socket 0.0.0.0:5000 --protocol=http -w wsgi:handler
sudo ufw delete allow 5000
sudo ufw allow 'Nginx Full'

