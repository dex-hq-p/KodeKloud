###

```

Identify the faulty app host and fix the issue. Make sure Apache service is up and running on all app hosts. They might not have hosted any code yet on these servers, so you don't need to worry if Apache isn't serving any pages. Just make sure the service is up and running. Also, make sure Apache is running on port 8089 on all app servers.

httpd chính là Apache (Apache HTTP Server) — đây là một phần mềm/ứng dụng thật sự, không phải giao thức. Nó là process chạy trên server, lắng nghe ở một port (mặc định 80, hoặc 3000 như trong bài lab của bạn), và xử lý các request theo đúng chuẩn giao thức HTTP.
```

```

## change port 
vi /etc/http/conf/httpd.conf

grep -i "^Listen" /etc/httpd/conf/httpd.conf /etc/httpd/conf.d/*.conf 2>/dev/null

ss -tlnp | grep 3000

systemctl status httpd


```