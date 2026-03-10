# Sprint5 コンテナ基盤構築

## 1. 概要
- ECS Fargate / ECR / ALB / RDS(MySQL) / NAT Gateway を用いた構成
- Go製 名簿管理API をコンテナで稼働
- Auto Scaling: min 2 / max 4 / CPU 70%

## 2. 構成図
- 構成図の画像添付

## 3. 使用サービス
- VPC
- Public Subnet ×2
- Private Subnet ×2
- Internet Gateway
- NAT Gateway
- ALB
- ECS Fargate
- ECR
- RDS(MySQL)
- CloudWatch Logs
- Bastion Server（必要に応じて）

## 4. Terraform構成
- 01_provider.tf
- 02_variables.tf
- 03_network.tf
- 04_security.tf
- 05_database.tf
- 06_loadbalancer.tf
- 07_app.tf
- 08_outputs.tf
- 09_bastion.tf

## 5. 動作確認
### health
- `/health` で status=ok を確認

### 登録
- POST `/api/persons`
- id/name/email/phone が返却されることを確認

### 検索
- GET `/api/persons`
- 登録済みデータが取得できることを確認

## 6. オートスケーリング
- ECS Service Auto Scaling を設定
- min=2 / max=4
- CPU使用率70%でスケールアウト設定
- 軽量APIのため短時間の負荷試験では明確なスケールアウトは確認できなかったが、設定は確認済み

## 7. 理解したこと
- 通信経路
- コンテナ化のメリット
- ECS構成要素（クラスター / タスク定義 / タスク / サービス）

## 8. 注意点
- terraform.tfvars はGit管理しない
- 検証後は terraform destroy を実施