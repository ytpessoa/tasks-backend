pipeline{
    agent any
    stages{
        //stage 1
        stage ('Build Backend'){
            steps{
                bat 'mvn clean package -DskipTests=true' //limpa, empacota, nao-executa teste
            }
        }
        //stage 2
        stage ('Unit tests'){
            steps{
                bat 'mvn test' 
            }
        }
        
    }


}