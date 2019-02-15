workflow "build_test_deploy" {
  on = "push"
  resolves = ["build_test","deploy"]
}

action "build_test" {
  uses = "docker://circleci/python:2.7.15"
  runs = "./.github/build_test.sh"
}

action "deploy" {
  uses = "docker://circleci/python:2.7.15"
  runs = "./.github/deploy.sh"
}
