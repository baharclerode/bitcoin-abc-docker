node("docker") {
	
	def buildEnv = docker.image("docker.dragon.zone:10080/bitcoind-build-env:1.0.5")

	buildEnv.inside {

		stage("Checkout Project") {
			sh "git clone -n https://github.com/Bitcoin-ABC/bitcoin-abc.git ."
			sh "git checkout -f v0.16.0"
		}

		stage("Build Bitcoind ABC") {
			sh "./autogen"
			sh "./configure --disable-wallet --without-miniupnpc --without-gui"
			sh "make"
		}

	}

}
