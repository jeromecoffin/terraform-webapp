#!/usr/bin/env bash


echo "[rancher]"
i=1
for ip in $(terraform output -json DSNA_rancher_ip | jq -r '.[]' | jq -r '.[]');
do
  echo "scdsnarancher$i ansible_host=$ip";
  i=$((i+1));
done

echo -e "\n[ws]"
i=1
for ip in $(terraform output -json DSNA_ws_ip | jq -r '.[]' | jq -r '.[]');
do
  echo "scdsnaws$i ansible_host=$ip";
  i=$((i+1));
done

echo -e "\n[database]"
i=1
for ip in $(terraform output -json DSNA_db_ip | jq -r '.[]' | jq -r '.[]');
do
  echo "scdsnadb$i ansible_host=$ip";
  i=$((i+1));
done

echo -e "\n[storage]"
i=1
for ip in $(terraform output -json DSNA_storage_ip | jq -r '.[]' | jq -r '.[]');
do
  echo "scdsnastorage$i ansible_host=$ip";
  i=$((i+1));
done

echo -e "\n[bastion]"
i=1
for ip in $(terraform output -json DSNA_bastion_eip);
do
  echo "scdsnabastion$i ansible_host=$ip ansible_ssh_common_args=''";
  i=$((i+1));
done

echo -e "\n[all:vars]"
echo "env=dsna"
echo "ansible_user=jerome"
echo "ansible_port=722"
echo "ansible_ssh_common_args='-o ProxyCommand=\"ssh -p 722 -o StrictHostKeyChecking=no -W %h:%p -q jerome@$ip\" -o StrictHostKeyChecking=no'"
echo "ansible_python_interpreter=/usr/bin/python3"
