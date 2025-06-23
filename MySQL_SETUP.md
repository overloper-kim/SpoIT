# MySQL 설정 가이드

## 1. MySQL 설치 및 설정

### MySQL Community Server 설치
1. [MySQL 공식 사이트](https://dev.mysql.com/downloads/mysql/)에서 MySQL Community Server 다운로드
2. 설치 시 root 비밀번호를 `1234`로 설정 (또는 원하는 비밀번호로 설정 후 application.properties 수정)

### MySQL Workbench 설치 (선택사항)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) 다운로드하여 설치
- 데이터베이스 관리를 위한 GUI 도구

## 2. 데이터베이스 및 테이블 생성

### 방법 1: MySQL 명령줄 사용
```bash
# MySQL에 접속
mysql -u root -p

# 비밀번호 입력 후 다음 명령어 실행
source database_setup.sql;
```

### 방법 2: MySQL Workbench 사용
1. MySQL Workbench 실행
2. Local instance에 연결
3. File > Open SQL Script 선택
4. `database_setup.sql` 파일 선택
5. Execute 버튼 클릭

## 3. application.properties 설정 확인

현재 설정:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/spoit?useSSL=false&serverTimezone=UTC&characterEncoding=UTF-8
spring.datasource.driverClassName=com.mysql.cj.jdbc.Driver
spring.datasource.username=root
spring.datasource.password=1234
```

만약 다른 비밀번호를 사용한다면 `spring.datasource.password`를 수정하세요.

## 4. 애플리케이션 실행

```bash
./gradlew bootRun
```

## 5. 테스트

애플리케이션이 정상적으로 실행되면 다음 URL로 접속하여 테스트:

- 메인 페이지: http://localhost:8082/
- 게임 목록: http://localhost:8082/games
- 로그인: http://localhost:8082/user/login

## 6. 문제 해결

### 포트 충돌 문제
- 8082 포트가 사용 중인 경우 `application.properties`에서 `server.port`를 다른 포트로 변경

### 데이터베이스 연결 문제
- MySQL 서비스가 실행 중인지 확인
- 비밀번호가 올바른지 확인
- 데이터베이스 `spoit`이 생성되었는지 확인

### 테이블 생성 문제
- `database_setup.sql` 스크립트가 정상적으로 실행되었는지 확인
- MySQL Workbench에서 테이블 목록 확인 