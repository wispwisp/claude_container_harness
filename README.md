# claude code Docker harness

## usefull commands
```bash
# exec into conter under root to install dependencies
docker exec -it -u root <container_name> /bin/bash

apt update && apt install -y <...>
```

## how to use
```bash
echo "alias claude=\"$(pwd -P)/run.sh\"" >> ~/.bash_aliases
```
