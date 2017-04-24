# sparql-dump
The sparql graph protocol support seems to fail in a lot of RDF stores when the amount of triples grows large enough.
This project provides a tool to dump a graph from a sparql endpoint through a batched construct query, which does seem to work on most endpoints.
Sparql-dump is written in java using sesame/rdf4j. The code could be cleaned up, but it does the job.

## Usage
```
# create a runnable jar
mvn clean package assembly:single
# this will store the dumps in a dumps folder in the current working directory
SPARQL_ENDPOINT=http://localhost/openrdf-sesame/repositories/test; SPARQL_GRAPH="http://example.org" java  -jar target/sparql-dump*dependencies.jar  
```

## Docker
This repository has been dockerized for your convenience:
```
docker run -e SPARQL_ENDPOINT=http://localhost/openrdf-sesame/repositories/test \
    -e SPARQL_GRAPH="http://example.org" \ 
    -v /your/path/to/store/dumps:/app/dumps \
    nvdk/sparql-dump
```

## Options
sparql-dump can/should be configured using ENV variables.

*SPARQL_ENDPOINT*: required, specify the sparql endpoint you which to use

*SPARQL_GRAPH*: required, specify the graph you wish to dump

*SPARQL_USER*: optional, user to authenticate with. Note that both user and password are required for authentication.

*SPARQL_PASSWORD*: optional, password to authenticate with. Note that both user and password are required for authentication.