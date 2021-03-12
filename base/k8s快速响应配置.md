# k8s快速响应配置

- https://github.com/kubernetes-sigs/kubespray/blob/master/docs/kubernetes-reliability.md
- https://kubernetes.io/zh/docs/reference/command-line-tools-reference/kube-controller-manager/

- 修改master节点/etc/kubernetes/manifests/kube-controller-manager.yaml
```yaml
spec:
  containers:
  - command:
    - kube-controller-manager
    - --node-monitor-period=2s
    - --node-monitor-grace-period=20s
    - --pod-eviction-timeout=30s
```
>- `--node-monitor-period` controller manager查询etcd获取k8s状态的周期
>- `--node-monitor-grace-period` controller manager超过此时间段仍未获取到节点状态更新则将节点标记为`NotReady`
>- `--pod-eviction-timeout` 节点`NotReady`后，此节点的POD将在此时间后受到驱逐
- 修改所有节点/var/lib/kubelet/config.yaml

```yaml
nodeStatusReportFrequency: 1m0s
nodeStatusUpdateFrequency: 4s
```
>- `nodeStatusReportFrequency` node节点上报自身状态频率
>- `nodeStatusUpdateFrequency` node节点状态更新上报频率