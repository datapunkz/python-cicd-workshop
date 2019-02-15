workflow "Python Install" {
  on = "push"
  resolves = ["Install Python 2.7.15"]
}

action "Install Python 2.7.15" {
  uses = "custom"
  runs = "python test_helloworld.py"
}