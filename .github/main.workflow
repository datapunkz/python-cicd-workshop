workflow "build_test_deploy" {
  on = "push"
  resolves = ["deploy"]
}

action "build_test" {
  uses = "docker://circleci/python:2.7.15"
  runs = "./.github/build_test.sh"
}


action "deploy" {
  uses = "docker://circleci/python:2.7.15"
  runs = "./.github/deploy.sh"
  needs = "build_test"
  secrets = ["DOCKER_LOGIN", "DOCKER_PWD"]
}
