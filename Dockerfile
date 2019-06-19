FROM haskell:8

RUN cabal update
RUN cabal install --allow-newer erd
RUN apt update
RUN apt-get install -y graphviz

ENTRYPOINT ["/root/.cabal/bin/erd"]
