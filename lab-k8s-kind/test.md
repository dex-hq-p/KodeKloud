 - etcd
    - --advertise-client-urls=https://172.18.0.4:2379
    - --cert-file=/etc/kubernetes/pki/etcd/server.crt
    - --client-cert-auth=true
    - --data-dir=/var/lib/etcd
    - --feature-gates=InitialCorruptCheck=true
    - --initial-advertise-peer-urls=https://172.18.0.4:2380
    - --initial-cluster=dex-cluster-control-plane=https://172.18.0.4:2380
    - --key-file=/etc/kubernetes/pki/etcd/server.key
    - --listen-client-urls=https://127.0.0.1:2379,https://172.18.0.4:2379
    - --listen-metrics-urls=http://127.0.0.1:2381
    - --listen-peer-urls=https://172.18.0.4:2380
    - --name=dex-cluster-control-plane
    - --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
    - --peer-client-cert-auth=true
    - --peer-key-file=/etc/kubernetes/pki/etcd/peer.key
    - --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
    - --snapshot-count=10000
    - --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
    - --watch-progress-notify-interval=5s



    mv /etc/kubernetes/manifests/kube-apiserver.yaml /tmp/

    ETCDCTL_API=3 etcdctl snapshot restore /tmp/etcd-backup.db \
  --data-dir=/var/lib/etcd-restored \
  --name=<TÊN_MEMBER> \
  --initial-cluster=<TÊN_MEMBER>=<PEER_URL> \
  --initial-cluster-token=etcd-cluster-1 \
  --initial-advertise-peer-urls=<PEER_URL>