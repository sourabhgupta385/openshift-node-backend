node {
   def NODEJS_HOME = tool "NODE_PATH"
   env.PATH="${env.PATH}:${NODEJS_HOME}/bin"
   sh 'npm --version'
   
   stage("Checkout Source"){
       checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/akilans/openshift-node-backend.git']]])
   }
   
   stage("Install Dependencies"){
        sh 'npm install'
   }
   
   stage("Code Quality"){
        sh 'npm run lint'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'quality.html', reportName: 'Quality Report', reportTitles: ''])
   }
   
   stage("Unit Test"){
        sh 'npm run test'
        publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'coverage', reportFiles: 'index.html', reportName: 'Coverage Report', reportTitles: ''])
   }
}
