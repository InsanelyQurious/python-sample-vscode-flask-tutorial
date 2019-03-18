workflow "Publish to App Service" {
  on = "push"
  resolves = ["Azure Login"]
}

 action "Azure Login" {
  uses = "Azure/github-actions/login@master"
  env = {
    AZURE_SUBSCRIPTION = "Microsoft Azure Internal Consumption"
  }
  secrets = ["AZURE_SERVICE_APP_ID", "AZURE_SERVICE_PASSWORD", "AZURE_SERVICE_TENANT"]
}

action "Deploy to Web App" {
  uses = "Azure/github-actions/webapp@master"
  needs = ["Azure Login"]
  env = {
    AZURE_APP_NAME = "pydemo01"
    AZURE_APP_PACKAGE_LOCATION = "hello_app"
  }
}
