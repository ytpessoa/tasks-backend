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
                sleep(5)
                timeout(time: 1, unit: 'MINUTES'){
                    waitForQualityGate abortPipeline: true //caso QG falhe, pare o pipeline
                }
                
            }
        }

        // stage('Deploy Backend'){
        //     steps{
        //         deploy adapters: [tomcat8(credentialsId: 'github_login', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks-backend', war: 'target/tasks-backend.war'
        //     }
        // }
        //precisa configurar o TomCat e integrar com o Jenkins

        stage('API Test'){
            steps{
                //baixa os arquivos de teste
                git credentialsId: 'github_login', url: 'https://github.com/ytpessoa/tasks-api-test'

                bat 'mvn test'
            }
        }



        
    }
}

