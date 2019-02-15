workflow "build_test" {
  on = "push"
  resolves = ["build_test"]
}

action "build_test" {
  uses = "docker://circleci/python:2.7.14"
  runs = "python test_helloworld.py"
}