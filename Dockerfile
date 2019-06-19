FROM haskell:8 AS build

RUN cabal update
RUN cabal install --allow-newer erd
RUN apt update

FROM ubuntu
RUN apt update -y
RUN apt-get install -y graphviz
COPY --from=build /root/.cabal/bin/erd /bin/erd

ENTRYPOINT ["/bin/erd"]
