pipeline{
    agent any
    stages{
        stage ('Build Backend'){
            steps{
                bat 'mvn clean package -DskipTests=true' //limpa, empacota, nao-executa teste
            }
        }
    }


}