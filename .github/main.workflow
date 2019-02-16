workflow "build_test_deploy" {
  on = "push"
  resolves = ["deploy"]
}

action "build_test" {
  uses = "docker://circleci/python:2.7.15"
  runs = "./.github/build_test.sh"
}

<<<<<<< HEAD
action "Docker Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_LOGIN", "DOCKER_PWD"]
  needs = "build_test"
}

action "deploy" {
  uses = "docker://circleci/python:2.7.15"
  runs = "./.github/deploy.sh"
  needs = "Docker Login"
  secrets = ["DOCKER_LOGIN", "DOCKER_PWD"]
=======
action "deploy" {
  uses = "docker://circleci/python:2.7.15"
  runs = "./.github/deploy.sh"
  needs = "build_test"
>>>>>>> master
}
