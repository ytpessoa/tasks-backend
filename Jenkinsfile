pipeline{
    agent any
    stages{
        
        stage('Build Backend'){
            steps{
                bat 'mvn clean package -DskipTests=true' //maven sem executar testes
            }
        }
       
       stage('Unit Tests'){
            steps{
                bat 'mvn test'  
            }
        }
       
       stage('Sonar Analysis'){
           environment{
               scannerHome = tool 'SONAR_SCANNER'
           }
            steps{

                withSonarQubeEnv('SONAR_LOCAL')
                {
                    bat "${scannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=DeployBack -Dsonar.host.url=http://localhost:9000 -Dsonar.login=bdd26cf332ba548f80aa78d32ac52a4bb9ee4313 -Dsonar.java.binaries=target -Dsonar.coverage.exclusions=**/.mvn/**,**/src/test/**,**/model/**,**Application.java"  
                }
                
            }
        }

        stage('Quality Gate'){
            steps{
                timeout(time: 1, unit: 'MINUTES'){
                    waitForQualityGate abortPipepine: true //caso QG falhe, pare o pipeline
                }
                
            }
        }
        
    }
}

