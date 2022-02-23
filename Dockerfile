FROM artifactory.axisb.com/docker/openjdk/11-jre-slim:latest-with-maximus-cacerts-v1

WORKDIR /home/workspace

ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib app/lib
COPY ${DEPENDENCY}/META-INF app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes app

USER 1

ENTRYPOINT ["java", "-cp", "app:app/lib/*", "com.axis.lending.ApplicationKt"]
