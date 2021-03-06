FROM bash:5.0 as builder

# Download Play 1.5
ADD https://downloads.typesafe.com/play/1.5.2/play-1.5.2.zip /home

# Unpack Play
RUN unzip -q /home/play-1.5.2.zip -d /home

# Grant execute permits on files in /home/play-1.5.2 directory
RUN chmod -R +x /home/play-1.5.2

FROM store/oracle/serverjre:8

# Install Play
COPY --from=builder /home/play-1.5.2 /opt/play-1.5.2
RUN ln -s /opt/play-1.5.2/play /usr/local/bin

# Create home place to play apps
RUN mkdir /home/play
WORKDIR /home/play

# Create Example app
RUN echo Example | play new webapp

# Execute development server
CMD ["play", "run", "webapp"]
