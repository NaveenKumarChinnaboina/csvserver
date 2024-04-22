# Part- I (Solution)

Pull the infracloudio/csvserver:latest Docker  image.

```bash
  docker pull infracloudio/csvserver:latest
 ``` 

The 'gencsv.sh' script will generate a file named 'inputFile' conataining a list of indices and random numbers.

Make the script executable:
```bash
chmod +x gencsv.sh
```
Run the script by providing the start and end indices.
```bash
./gencsv.sh 2 8
```
Run the Docker container, mounting the inputFile ans Environment variable.

```bash
docker run -d --name csvserver -e CSVSERVER_BORDER='Orange' -v ${PWD}/inputFile:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver
```
```bash
curl -o ./part-1-output http://localhost:9393/raw
```
```bash
docker logs 4d4ff5fd52df >& part-1-logs
```

# Part - II Solution

Created docker-compose file and csvserver with Environment variable.

```bash 
docker-compose up
```
# Part -III Solution

Update the Docker Compose Configuration

Create Prometheus configuration file , which tells Prometheus where to find the metrics to scape.

```bash
mkdir -p ./prometheus
nano ./prometheus/prometheus.yml
```

Save the configurations and Run the docker compose.

```bash
docker-compose up
```
Verify the Prometheus Configuration

```
http://localhost:9090
```
In prometheus dashboard - Query the 'csvserver_records' and execute.

![alt text](<Screenshot from 2024-04-22 12-56-33.png>)
