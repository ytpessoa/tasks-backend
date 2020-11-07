pipeline{
    agent any
    stages{

        //1 Jenkins já baixa do repositorio de Backend: https://github.com/ytpessoa/tasks-backend        
        
        // 2
        stage('Build Backend'){
            steps{
                bat 'mvn clean package -DskipTests=true' //maven sem executar testes
            }
        }
       
       // 3
       stage('Unit Tests'){
            steps{
                bat 'mvn test'  
            }
        }
       
    //    //4
    //    stage('Build FrontEnd'){
    //         steps{
    //             dir('frontend'){ //baixa na pasta frontend
    //                 //baixa o código
    //                 git credentialsId: 'github_login', url: 'https://github.com/ytpessoa/tasks-frontend'

    //                 //Build
    //                 bat 'mvn clean package' //nao tem testes
                    
    //                 //deploy no Tomcat
    //                 //deploy adapters: [tomcat8(credentialsId: 'github_login', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks', war: 'target/tasks.war'
    //             }
                
    //         }
    //     }

      // 4 Integração com o Sonar 
       stage('Sonar Analysis'){
           environment{
               scannerHome = tool 'SONAR_SCANNER'
           }
            steps{

                withSonarQubeEnv('SONAR_LOCAL')
                {
                    bat "${scannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=DeployBack -Dsonar.host.url=http://localhost:9000 -Dsonar.login=3273f98ab105ff5a4d91b6db4b46120f2a1d170e -Dsonar.java.binaries=target -Dsonar.coverage.exclusions=**/.mvn/**,**/src/test/**,**/model/**,**Application.java"  
                }
                
            }
        }

    // 5 Quality Gate
        stage('Quality Gate'){
            steps{
                sleep(5)
                timeout(time: 1, unit: 'MINUTES'){
                    waitForQualityGate abortPipeline: true //caso QG falhe, pare o pipeline
                }
                
            }
        }


    // //     stage('Deploy Backend'){
    // //         steps{
    // //             deploy adapters: [tomcat8(credentialsId: 'github_login', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks-backend', war: 'target/tasks-backend.war'
    // //         }
    // //     }
    // //     //precisa configurar o TomCat e integrar com o Jenkins


    // //     stage('API Test'){
    // //         steps{

    // //             dir('api-test'){
    // //                 //baixa os arquivos de teste
    // //                 git credentialsId: 'github_login', url: 'https://github.com/ytpessoa/tasks-api-test'
    // //                 bat 'mvn test'            
    // //             }
    // //         }
    // //     }





    // //     stage('Deploy FrontEnd'){
    // //         steps{
    // //             dir('frontend'){ //baixa na pasta frontend
    // //                 //baixa o código
    // //                 git credentialsId: 'github_login', url: 'https://github.com/ytpessoa/tasks-frontend'

    // //                 //Build
    // //                 bat 'mvn clean package' //nao tem testes
                    
    // //                 //deploy no Tomcat
    // //                 deploy adapters: [tomcat8(credentialsId: 'github_login', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks', war: 'target/tasks.war'
    // //             }
                
    // //         }
    // //     }
       

    // //     stage('Functional Test'){ //no FrontEnd
    // //         steps{

    // //             dir('functional-test'){
    // //                 //baixa os arquivos de teste
    // //                 git credentialsId: 'github_login', url: 'https://github.com/ytpessoa/tasks-functional-tests'
    // //                 bat 'mvn test'            
    // //             }
    // //         }
    // //     }


    // stage('Deploy Prod'){
    //     steps{
    //         bat 'docker-compose build'
    //         bat 'docker-compose up -d' // -d:liberar terminal 
    //     }
    // }

        
    } // fim stages
}

