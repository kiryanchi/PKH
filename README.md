# GitHub Action Study

GitHub Action을 잘 다루기 위해 생성한 프로젝트입니다.

## 따라하기

### 1. EC2 인스턴스 설정

> OS: Amazon Linux

1. EC2 Instance 생성
2. inbound 규칙 수정

   nginx 포트 번호 80 open
3. docker 설치 및 실행
    ```shell
   sudo yum install docker -y
   sudo systemctl start docker
   ```
4. docker-compose 설치
   ```shell
    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    mkdir -p $DOCKER_CONFIG/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.24.1/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    ```
5. nginx 설치
   
   ```shell
   sudo amazon-linux-extras install nginx1
   sudo systemctl start nginx
   ```

### 2. Fork

## 참고자료

[gradle/gradle-build-action](https://github.com/gradle/gradle-build-action)

[actions/cache - Java - Gradle](https://github.com/actions/cache/blob/main/examples.md#java---gradle)