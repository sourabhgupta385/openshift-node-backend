# Steps to configure in Openshift

    * Install jenkins with NodeJS/HTML publisher plugin
    * Configure Global tool for NODE_PATH environment variable

    * oc new-app https://github.com/akilans/openshift-node-backend.git  --strategy=pipeline --env DB_URL=DB_URL=mongodb://admin:admin@mongodb:27017/employee --name=node-backend-pipeline

    * 