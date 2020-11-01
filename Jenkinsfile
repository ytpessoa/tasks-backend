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
       
        
    }
}