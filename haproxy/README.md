### Run the example:

```
sudo nomad agent -dev
consul agent -dev
nomad job run http_haproxy.hcl
```

The restart HAProxy with this configuration file: haproxy.cfg

```
systemctl restart haproxy
```

or

```
systemctl stop haproxy
systemctl start haproxy
```

Then, in the browser, go to: 

```
http://localhost
```