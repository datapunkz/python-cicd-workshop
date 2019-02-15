workflow "build_test" {
  on = "push"
  resolves = ["build_test01"]
}

action "build_test01" {
  uses = "docker://circleci/python:2.7.14"
  runs = "python -V"
}

# action "run whoami cmd" {
#   uses = "docker://circleci/python:2.7.14"
#   runs = "whoami"
# }