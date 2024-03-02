### Run the example:

```
sudo nomad agent -dev
```

Then, in the other terminal:

```
consul agent -dev
```

Then, in the third terminal:

```
nomad job run http_haproxy.hcl
```

Then restart HAProxy with this configuration file: haproxy.cfg

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
localhost
```