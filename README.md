# server-playbook

## 準備
dev_hostsのユーザー名を修正する
```shell
# ansible_ssh_userを各自のユーザー名に変更
[webservers]
164.70.69.3 ansible_ssh_user=<ユーザー名>
```

## サーバーとの疎通確認

```shell
ansible webservers -i dev_hosts -m ping
```

## 実行
実行する場合は -C を外す
```shell
# ドライラン
ansible-playbook webservers-playbook.yml -i dev_hosts -K -C
```
```shell
# ドライラン
# soto用のplaybook
ansible-playbook soto-playbook.yml -i dev_hosts -K -C
```

## 参考

### 新規ロール作成

```shell
ansible-galaxy init role_name
```
- [公式Doc](https://docs.ansible.com/ansible/2.9_ja/galaxy/dev_guide.html)

### ディレクトリ構造

- [ansibleのディレクトリ構造](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html)

### mysql準備

```sql
# 外部接続用のユーザー作成
CREATE USER 'soto'@'%' IDENTIFIED BY '<パスワード>';

# sotoデータベースの外部からの接続を許可
GRANT ALL PRIVILEGES ON soto.* TO 'soto'@'%';

# 確認
show grants for 'soto'@'%';
```
