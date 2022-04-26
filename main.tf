resource "aws_amplify_app" "aws-realtime-dashboard-frontend-tf" {
  name       = "aws-realtime-dashboard-frontend-tf"
  repository = "https://github.com/marcosortiz/aws-realtime-dashboard.git"
  
  access_token = "YOUR-TOKEN"
  enable_branch_auto_build = true
  build_spec = <<-EOT
    version: 1
    applications:
      - frontend:
          phases:
            preBuild:
              commands:
                - npm install
            build:
              commands:
                - npm run build
          artifacts:
            baseDirectory: build
            files:
              - '**/*'
          cache:
            paths:
              - node_modules/**/*
        appRoot: frontend
  EOT
  
  environment_variables = {
      AMPLIFY_DIFF_DEPLOY = false
      AMPLIFY_MONOREPO_APP_ROOT = "frontend"
  }

}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.aws-realtime-dashboard-frontend-tf.id
  branch_name = "main"
  framework = "React"
  stage     = "PRODUCTION"
}