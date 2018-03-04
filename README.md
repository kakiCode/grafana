##docker image for grafana

- can be pulled from docker hub:
    - [caquicode/grafana](https://hub.docker.com/r/caquicode/grafana/)
    
- hostname: grafana
- expects:
    - to resolve the influx database host on ``influxdb``
- exposes:
    - port ``3000`` for web access to dashboards
- scripts:
    - create.sh - pulls third party grafana docker image and pushes it to dockerHub;
    - run.sh - runs an image container in the local docker engine;    
- example docker-compose section:

	  grafana:
	    image: caquicode/grafana
	    container_name: grafana
	    depends_on: 
	      - influxdb
	    links:
	      - "influxdb:influxdb"
	    environment:
	      - GF_SECURITY_ADMIN_USER=root
	      - GF_SECURITY_ADMIN_PASSWORD=password
	    ports:
	      - "3000:3000"
