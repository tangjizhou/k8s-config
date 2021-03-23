ghz --insecure --duration-stop wait \
--proto=helloworld.proto 192.168.0.2:50052 \
--call StressTest.Greeter/SayHello -D body1k.json \
-c 3 -t 2s -z 10s