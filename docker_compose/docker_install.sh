#!/bin/bash

# Docker 설치 전 필수 패키지 업데이트 및 설치
sudo yum update -y
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Docker 리포지토리 추가
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

# Docker 설치
sudo yum install -y docker-ce docker-ce-cli containerd.io

# Docker 시작 및 부팅 시 자동 실행 설정
sudo systemctl start docker
sudo systemctl enable docker

# 현재 사용자를 Docker 그룹에 추가하여 sudo 없이 사용 가능하게 설정 (옵션)
sudo usermod -aG docker $USER

# Docker Compose 설치 (1.29.2 버전 설치 예시)
DOCKER_COMPOSE_VERSION="1.29.2"
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# 실행 권한 부여
sudo chmod +x /usr/local/bin/docker-compose

# 설치 확인
docker --version
docker-compose --version

echo "Docker와 Docker Compose가 성공적으로 설치되었습니다."