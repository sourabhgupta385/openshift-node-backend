# Steps to configure in Openshift

    * Launch mongodb template with username admin & password admin

    * Create a Pipeline for the project. It automatically lauches jenkins container

    * oc new-app https://github.com/akilans/openshift-node-backend.git  --strategy=pipeline --env DB_URL=mongodb://admin:admin@mongodb:27017/employee?authSource=admin --name=node-backend-pipeline

    * Provide access to jenkins to access some other projects

    * Install jenkins with NodeJS/HTML publisher plugin
    * Configure Global tool for NODE_PATH environment variable 

    * oc policy add-role-to-user edit system:serviceaccount:coe-openshift:jenkins -n prod-coe-mern-stack

    * oc new-app https://github.com/akilans/openshift-node-backend.git --strategy=docker --env DB_URL=mongodb://admin:admin@mongodb:27017/employee?authSource=admin --name=node-backend-app
    * oc expose svc node-backend-app

    * Change the project to "prod-coe-mern-stack"

    * oc new-app https://github.com/akilans/openshift-node-backend.git --strategy=docker --env DB_URL=mongodb://admin:admin@mongodb:27017/employee?authSource=admin --name=node-backend-app

    * oc expose svc node-backend-app


