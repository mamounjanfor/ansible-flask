pipeline {
      agent any
          stages {
               stage('Clone Repository') {
               steps {
               checkout scm
               }
          }
          stage('Build Image') {
               steps {
               sh "docker build -t 19841022/flask ."
               }
         }
         stage('Push image') {
               steps {
               sh 'docker push 19841022/flask'
               }
         stage('Deploy') {
               steps {
                ansiColor('xterm') { 
                ansiblePlaybook( 
                colorized: true, 
                playbook: "docker-install-playbook.yaml", 
                credentialsId: "sa-jenkins-ssh-access" 
                ) 
                ansiblePlaybook( 
                colorized: true, 
                playbook: "app-run-playbook.yaml", 
                credentialsId: "sa-jenkins-ssh-access", 
                extras: '-e image_id=$imagename:$BUILD_NUMBER"')   
                }
               }      
         }
         stage('Testing') {
              steps {
                    echo 'Testing...'
                    }
         }
}
}
