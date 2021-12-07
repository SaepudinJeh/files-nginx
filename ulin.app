    server_name www.ulin-app.xyz ulin-app.xyz;

    # Enforce HTTPS
    return 301 https://www.ulin-app.xyz$request_uri;
}


server {
    listen 443          ssl http2;
    listen [::]:443     ssl http2;
    server_name         www.ulin-app.xyz;

    ssl_certificate     /etc/letsencrypt/live/www.ulin-app.xyz/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/www.ulin-app.xyz/privkey.pem;

   # Path to the root of your installation
    root /home/ulin-apps/fe-ulin/fe-ulin/FE_Ulin_App/FE_Ulin_App/dist;

   index index.html;

   location / {
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404
        try_files $uri $uri/  @rewrites;
   }

   location @rewrites {
        rewrite ^(.+)$ /index.html last;
   }

   location ~* \.(?:ico|css|js|gif|jpe?g|png)$ {
    # Some basic cache-control for static files to be sent to the browser
    expires max;
    add_header Pragma public;
    add_header Cache-Control "public, must-revalidate, proxy-revalidate";
  }


}

