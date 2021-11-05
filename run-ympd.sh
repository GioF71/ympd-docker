#!/bin/sh

echo "#!/bin/sh" > /start-ympd.sh
echo "/usr/bin/ympd --host $MPD_HOSTNAME --port $MPD_PORT" >> /start-ympd.sh

chmod +x /start-ympd.sh

echo "About to sleep for $STARTUP_DELAY_SEC second(s)"
sleep $STARTUP_DELAY_SEC
echo "Rise and shine!"

/start-ympd.sh
