# Steps to configure in Openshift

    * Install jenkins with NodeJS/HTML publisher plugin
    * Configure Global tool for NODE_PATH environment variable

    * oc new-app https://github.com/akilans/openshift-MERN.git --context-dir=node-backend --strategy=pipeline --env DB_URL=DB_URL=mongodb://mongodb:27017/employee

    * 