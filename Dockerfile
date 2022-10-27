FROM nixos/nix

COPY . /app

WORKDIR /app

RUN nix-env -f shell.nix -i -A buildInputs

ENV JULIA_DEPOT_PATH="/julia"

RUN julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
