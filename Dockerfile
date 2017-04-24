FROM maven
ENV SPARQL_ENDPOINT "http://172.31.64.71:8001/openrdf-sesame"
ENV SPARQL_GRAPH "http://mu.semte.ch/application"
COPY . /app
WORKDIR /app
RUN mvn clean package assembly:single
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/usr/bin/java -jar target/sparql-dump-*-with-dependencies.jar"]
