version: 0.2

#env:
  #variables:
     # key: "value"
     # key: "value"
  #parameter-store:
     # key: "value"
     # key: "value"
  #secrets-manager:
     # key: secret-id:json-key:version-stage:version-id
     # key: secret-id:json-key:version-stage:version-id
  #exported-variables:
     # - variable
     # - variable
  #git-credential-helper: yes
#batch:
  #fast-fail: true
  #build-list:
  #build-matrix:
  #build-graph:
phases:
  #install:
    #If you use the Ubuntu standard image 2.0 or later, you must specify runtime-versions.
    #If you specify runtime-versions and use an image other than Ubuntu standard image 2.0, the build fails.
    #runtime-versions:
      # name: version
      # name: version
    #commands:
      # - command
      # - command
  #pre_build:
    #commands:
      # - command
      # - command
  build:
    commands:
      # - command
      # - command
  post_build:
    commands:
      - aws lambda update-function-code --function-name ${lambda_name} --s3-bucket ${artifact_bucket} --s3-key ${artifact}
      # - command
#reports:
  #report-name-or-arn:
    #files:
      # - location
      # - location
    #base-directory: location
    #discard-paths: yes
    #file-format: JunitXml | CucumberJson
#artifacts:
  #files:
    # - location
    # - location
  #name: $(date +%Y-%m-%d)
  #discard-paths: yes
  #base-directory: location
#cache:
  #paths:
    # - paths