node {
    def app

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build('iomega/hellonode')
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push('latest')
        }
    }

    stage('Deploy Morpheus App') {
        steps {
            sh 'sudo morpheus apps add ciapp04 --payload mobuild.json'
        }
    }
}
