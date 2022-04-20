#!/bin/bash
sed -i 's/archive/in.archive/g' /etc/apt/sources.list
echo 'Acquire::http::Proxy "http://10.177.28.1:9128/";' > /etc/apt/apt.conf.d/proxy.conf
