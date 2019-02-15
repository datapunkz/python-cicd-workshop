workflow "build_test" {
  on = "push"
  resolves = ["build_test01"]
}

action "run ls cmd" {
  uses = "docker://circleci/python:2.7.14"
  runs = "ls -la && whoami && python -V"
}

# action "run whoami cmd" {
#   uses = "docker://circleci/python:2.7.14"
#   runs = "whoami"
# }