node("docker") {

    stage("Checkout Project") {
        checkout scm
    }

    def image
    def tag

    stage("Build Docker Image") {
        def revision = sh(returnStdout: true, script: 'git ls-remote --heads https://github.com/Bitcoin-ABC/bitcoin-abc.git master | cut -f 1').trim()
        tag = sh(returnStdout: true, script: "git ls-remote --tags https://github.com/Bitcoin-ABC/bitcoin-abc.git | grep \"${revision}\" | cut -f 2 | cut -d / -f 3").trim()

        docker.withRegistry('https://docker.dragon.zone:10080', 'jenkins-nexus') {
            image = docker.build("\"baharclerode/bitcoin-abc:master-${revision.take(6)}-${env.BUILD_NUMBER}")
        }
    }

    stage("Push Docker Image") {
        docker.withRegistry('https://docker.dragon.zone:10081', 'jenkins-nexus') {
            image.push()
            if (tag) {
                image.push(tag + "-${env.BUILD_NUMBER}")
            }
        }
    }
}