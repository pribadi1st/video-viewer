## TODO
- [ ] Make sure the application works as expected.
- [ ] Consider the performance.
- [ ] If you're not familiar with React, feel free to replace it with your
  own favorite js framework.
- [ ] Follow best practices for code maintainability.

---

## Setup
- Do Docker-compose up
- Make sure everything is running 
- Create db by running `docker-compose run api rake db:create`
- Create schema by running `docker-compose run api rake db:migrate`
- Seeding DB `docker-compose run api rake db:seed`

### Prerequisites

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

### Installation
If you're using an M1/2 Mac OS, please consider creating this environment variable:
`CPU_ARCH=arm64`

```shell
docker-compose build
docker-compose run api rake db:setup
docker-compose run api rake db:migrate
```

## Usage
### Tests

```shell
docker-compose run api rake db:migrate RAILS_ENV=test
docker-compose run api rspec
```

### Run

```shell
docker-compose up
open http://localhost:8000
```

