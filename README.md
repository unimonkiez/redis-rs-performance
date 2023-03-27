# Installation

- Install NodeJS
- Install Python and Poetry
- Install Rust
- Install Docker
- Run installation
  ```sh
  `./install.sh`
  ```

# Usage

- Start redis via Docker
  ```sh
  docker run -p 6380:6379 -it --rm redis/redis-stack-server:latest
  ```
- Run profiling
  ```sh
  ./run.sh
  ```
