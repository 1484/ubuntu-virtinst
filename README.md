# ubuntu-virtinst
LinuxにKVM(libvirt)をインストールされている環境で用いる事が出来るscriptです。shellscriptのみで実施も出来ますし、Vagrantも導入されていれば更に楽をする事が出来ます。

## 構築方法
まず必須条件としてはKVMが用いる事が出来る事となります。
Vagrantが利用可能でしたらVagrantが導入出来ていると便利です。

### Shellscriptで構築する方法
まずはnetworkフォルダにあるscriptでKVM上にネットワークを構築します。

```
$ cd network
$ sh ./net-define.sh
$ cd ..
```

その後node1,node2,node3を作成します。

```
$ sh ./virtinst-stack01.sh
$ sh ./virtinst-stack02.sh
$ sh ./virtinst-stack03.sh

```

`linux text`と指定した状態のインストール画面で進んでいきます。完了した所で画面が止まりますので `ctrl + ]` で抜けて次に進む事が出来ます。

stack02及びstack03ではOSをインストールするVolume以外にswiftで用いるVolumeをアタッチしていますのでGRUBをどこに入れるか聞かれます。そこでは `/dev/vda` と入力してください。

## Vagrantで構築する方法
Vagrantがインストールされている必要はありますが `vagrant up` 一発で上記NW設定や３台のノードインストールが完了するのでオススメです。

### login user

|| ID | Password |
|:-|:-|:-|
|shellscript| ubuntu | passw0rd |
|Vagrant | vagrant | vagrant |

ただしVagrantの場合は `vagrant ssh node1` とする事でPasswordを聞かれる事無くログインが出来ますのでそちらが便利です。

## Network環境

|| IP address |
|:-|:-|
|node1| 192.168.100.10|
|node2| 192.168.100.11|
|node3| 192.168.100.12|
