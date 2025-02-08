# server-playbook

## 疎通確認

```shell
ansible webservers -i dev_hosts -m ping
```

## 新規ロール作成

```shell
ansible-galaxy init role_name
```
- [公式Doc](https://docs.ansible.com/ansible/2.9_ja/galaxy/dev_guide.html)


## 実行

```shell
ansible-playbook webservers-playbook.yml -i dev_hosts -K -C
```

## 参考

- [ansibleのディレクトリ構造](https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html)
