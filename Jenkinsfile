pipeline{
    agent any
    stages{
        stage('Build Backend'){
            steps{
                bat 'mvn clean package -DskipTests=true' //maven sem executar testes
            }
        }
        stage('Meio'){
            steps{
                bat 'echo Meioooooo'
            }
        }
        stage('Fim'){
            steps{
                sleep(5)
                bat 'echo Fimmmmm'
            }
        }
    }
}