  # Steps 
      
      * Create 2 projects in Openshift Web Console. One for QA[node-qa] and another one for Production[node-prod]
      * Launch mongodb template with username admin & password admin on both projects
      * oc project node-qa - Switch to QA project
      * oc new-app jenkins-persistent -p ENABLE_OAUTH=false -e JENKINS_PASSWORD=admin -n ms-qa - Create Jenkins Instance
      * Increase the Quota to 1.5GB of RAM and 2500 millicores CPU by going Applications -> Deployments -> Jenkins -> Edit Resource Limits
      * Install NodeJS Plugin and HTML publisher plugin
      * Go to Global tool configuration and set NodeJS installation path NODE_PATH] by clicking Install Automatically button. Select NodeJS version 9.11.2. Install global package "artillery"
      * oc policy add-role-to-group system:image-puller system:serviceaccounts:node-prod -n node-qa - Give permission to PROD to pull the image from QA
      * oc policy add-role-to-user edit system:serviceaccount:node-qa:jenkins -n node-prod - Give permission to jenkins to deploy to PROD
      * oc new-app https://github.com/akilans/openshift-node-backend.git --strategy=docker --env DB_URL=mongodb://admin:admin@mongodb:27017/employee?authSource=admin --name=node-backend-app
      * oc expose svc/node-backend-app - Create route for node-backend service
      * oc tag node-backend-app:latest node-backend-app:prod - Tag the image for production Deployment
      * oc new-app node-qa/node-backend-app:prod --name=node-backend-app -n node-prod
      * oc expose svc/node-backend-app -n node-prod
      * oc new-app https://github.com/akilans/openshift-node-backend.git --strategy=pipeline --name=node-backend-pipeline
