# Simple Flask App

A Python Flask application that says "Hello, World!"

## Goal

* "Dockerize" the application, providing an image and a configuration for
  running locally with Docker Compose.
* Provide a script to retrieve data from application and perform basic parsing.
* Provide a reverse proxy configuration.

## Docker Exercise

I have created with docker-compose three instances of the Python Flask application behind a nginx simple round robin load balancer reverse proxy. Two out of the three have custom welcome messages, but web_02 uses the default. So if you hit the site repeatedly, you should see the two custom messages and the default message.

I have created a simple perl script (scripts/data_collect.pl) to collect the data for the Flask app and create the respective files in the files directory. It then checks the SHA256 of the files against the id parameter to confirm a match.

For the reverse proxy configuration I have a nginx.conf file in the nginx directory. This is the one I am using to configure the simple round robin load balancer reverse proxy that I am running for this application. I know that it is mainly setup as a load balancer. I do have it set to port 5001 for my machine. I actually had MS Edge helper running on that port so I needed to redirect it to start the service.

I have caching at 3 seconds so to see the RR effect of the messages you have to let a few seconds pass.
I also have the reverse proxy doing SSL termination with a self signed cert. This works in Firefox with a /etc/hosts entry pointing to apogee.usgs.localhost on port 443.
