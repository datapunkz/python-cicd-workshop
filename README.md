# Introduction to CI/CD Workshop

This repo hosts the codebase and tutorial for an Introductory CI/CD Workshop. The workshop is designed to demonstrate and explain how to implement a CI/CD pipeline into a codebase.

This project is based off of Angel Rivera's CI/CD workshop, and made even MORE simple by Kate Catlin. 

## Tutorial

The original tutorial can be found in the `tutorial/` directory of this repo. The [icd_101_guide.md](tutorial/cicd_101_guide.md) file hosts the tutorial content for the hands on portion of this tutorial. If following, you should see the original project here: https://github.com/datapunkz/python-cicd-workshop

## Tutorial V2

This version of the project is a riff by Kate Catlin, created for THAT Conference in August 2019. 

Here are the steps: 
-- Fork this project
-- Add Project to CCI 
-- Copy/paste the sample config generated on CCI for Python. 
-- Change the "run tests" bit to a new section because this uses unittest not Django's built in test runner. 
```
      - run:
          name: Run Tests
          command: ~/.local/bin/pytest
```
-- Change the install dependencies to this: 
```
      - run:
          name: Install Python Dependencies
          command: |
            pip install --user --no-cache-dir -r requirements.txt
 ```
 -- Add in a new orb: 
 ```
[BONUS ROUND]
Choose an "orb" to add here: https://circleci.com/orbs/registry/?showAll=false
 ```


CircleCI's auto-generated config... 

# Python CircleCI 2.0 configuration file
#
# Check https://circleci.com/docs/2.0/language-python/ for more details
#
version: 2
jobs:
  build:
    docker:
      # specify the version you desire here
      # use `-browsers` prefix for selenium tests, e.g. `3.6.1-browsers`
      - image: circleci/python:3.6.1

      # Specify service dependencies here if necessary
      # CircleCI maintains a library of pre-built images
      # documented at https://circleci.com/docs/2.0/circleci-images/
      # - image: circleci/postgres:9.4

    working_directory: ~/repo

    steps:
      - checkout

      # Download and cache dependencies
      - restore_cache:
          keys:
            - v1-dependencies-{{ checksum "requirements.txt" }}
            # fallback to using the latest cache if no exact match is found
            - v1-dependencies-

      - run:
          name: install dependencies
          command: |
            python3 -m venv venv
            . venv/bin/activate
            pip install -r requirements.txt

      - save_cache:
          paths:
            - ./venv
          key: v1-dependencies-{{ checksum "requirements.txt" }}

      # run tests!
      # this example uses Django's built-in test-runner
      # other common Python testing frameworks include pytest and nose
      # https://pytest.org
      # https://nose.readthedocs.io
      - run:
          name: run tests
          command: |
            . venv/bin/activate
            python manage.py test

      - store_artifacts:
          path: test-reports
          destination: test-reports
