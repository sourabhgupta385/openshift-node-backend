node {
   def NODEJS_HOME = tool "NODE_PATH"
   env.PATH="${env.PATH}:${NODEJS_HOME}/bin"
   sh 'npm --version'
   
   stage("Checkout Source"){
       checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/akilans/openshift-MERN.git']]])
   }
   
   stage("Install Dependencies"){
     dir('node-backend') {
         if(isUnix()){
                sh 'npm install'
         }else{
                bat 'npm install'
         }
     }
   }
   
   stage("Code Quality"){
     dir('node-backend') {
             sh 'npm run lint'
             publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: '', reportFiles: 'quality.html', reportName: 'Quality Report', reportTitles: ''])
     }
   }
   
   stage("Unit Test"){
     dir('node-backend') {
            sh 'npm run test'
            publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'coverage', reportFiles: 'index.html', reportName: 'Coverage Report', reportTitles: ''])
     }
   }
}
