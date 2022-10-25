# Load balancer

In this project, I continued to build up the configuration of the web server
issued in project 0x0B. I was issued two additional servers, one to replicate
the Nginx configuration of my original server, and another to set up an HAproxy
load balancer on to manage both web servers.

## Tasks :page_with_curl:

* **0. Double the number of webservers**
  * [0-custom_http_response_header](./0-custom_http_response-header):In this first task you need to configure web-02 to be identical to web-01. Fortunately, you built a Bash script during your web server project, and they’ll now come in handy to easily configure web-02. Remember, always try to automate your work!

Since we’re placing our web servers behind a load balancer for this project, we want to add a custom Nginx response header. The goal here is to be able to track which web server is answering our HTTP requests, to understand and track the way a load balancer works. More in the coming tasks.

Requirements:

    Configure Nginx so that its HTTP response contains a custom header (on web-01 and web-02)
        The name of the custom HTTP header must be X-Served-By
        The value of the custom HTTP header must be the hostname of the server Nginx is running on
    Write 0-custom_http_response_header so that it configures a brand new Ubuntu machine to the requirements asked in this task
        Ignore SC2154 for shellcheck


* **1. Install your load balancer**
  * [1-install_load_balancer](./1-install_load_balancer):Install and configure HAproxy on your lb-01 server.

Requirements:

  *  Configure HAproxy so that it send traffic to web-01 and web-02
  *  Distribute requests using a roundrobin algorithm
  *  Make sure that HAproxy can be managed via an init script
  *  Make sure that your servers are configured with the right hostnames: [STUDENT_ID]-web-01 and [STUDENT_ID]-web-02. If not, follow this tutorial.
  *  For your answer file, write a Bash script that configures a new Ubuntu machine to respect above requirements

Example:
```

sylvain@ubuntu$ curl -Is 54.210.47.110
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Mon, 27 Feb 2017 06:12:17 GMT
Content-Type: text/html
Content-Length: 30
Last-Modified: Tue, 21 Feb 2017 07:21:32 GMT
Connection: keep-alive
ETag: "58abea7c-1e"
X-Served-By: 03-web-01
Accept-Ranges: bytes

sylvain@ubuntu$ curl -Is 54.210.47.110
HTTP/1.1 200 OK
Server: nginx/1.4.6 (Ubuntu)
Date: Mon, 27 Feb 2017 06:12:19 GMT
Content-Type: text/html
Content-Length: 612
Last-Modified: Tue, 04 Mar 2014 11:46:45 GMT
Connection: keep-alive
ETag: "5315bd25-264"
X-Served-By: 03-web-02
Accept-Ranges: bytes

sylvain@ubuntu$

```

* **2. 2-puppet_custom_http_response_header.pp**
  * [2-puppet_custom_http_response_header.pp](2-puppet_custom_http_response_header.pp):Just as in task #0, we’d like you to automate the task of creating a custom HTTP header response, but with Puppet.

    * The name of the custom HTTP header must be X-Served-By
    * The value of the custom HTTP header must be the hostname of the server Nginx is running on
    * Write 2-puppet_custom_http_response_header.pp so that it configures a brand new Ubuntu machine to the requirements asked in this task

