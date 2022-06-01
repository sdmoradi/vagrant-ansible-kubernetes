  kubeadm join vip-k8s-master:8443 --token rn5dt5.gr1989f80s43bxb8 \
	--discovery-token-ca-cert-hash sha256:d265fb3e0b757f4758326b38983c658065ccd676fe04727cc650c4242035a4cf \
	--control-plane --certificate-key f3a47f322c9161775cd151a5628f6f21cb98f35edb2bbbbd58fd7a5beb88b0d5
