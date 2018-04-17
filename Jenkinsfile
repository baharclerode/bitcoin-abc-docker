node("docker") {
	
	def buildEnv = docker.image("docker.dragon.zone:10080/baharclerode/bitcoind-build-env:1.0.8")

	buildEnv.inside {

		stage("Checkout Project") {
                        checkout scm
                        sh "git submodule init"
                        sh "git submodule update"
		}

		stage("Build Bitcoind ABC") {
			sh "cd bitcoin-abc && ./autogen.sh"
			sh "cd bitcoin-abc && ./configure --disable-wallet --without-miniupnpc --without-gui"
			sh "cd bitcoin-abc && make distclean"
			sh "cd bitcoin-abc && make"
                        sh "strip bitcoin-abc/src/bitcoind"
                        sh "strip bitcoin-abc/src/bitcoin-tx"
                        sh "strip bitcoin-abc/src/bitcoin-cli"
		}
	}

        stage("Build Docker Image") {
                docker.build("docker.dragon.zone:10080/bitcoin-abc:0.17.0.${env.BUILD_NUMBER}")
        }
}
