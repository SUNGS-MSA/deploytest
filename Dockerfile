# openjdk을 기반 이미지로 설정
#FROM openjdk:8-jdk-alpine
FROM openjdk:17

#도커파일애서 gradle로 jar파일 생성도 하고 싶을 경우
#CMD ["./gradlew", "clean", "bootJar"]

#컨테이너 안의 사용 디렉토리(여기서 ENTRYPOINT 의 실행명령어 실행)
WORKDIR /app

# build시 사용되는 변수 설정
ARG JAR_FILE_PATH=build/libs/*.jar

# 컨테이너에 파일 복사
COPY ${JAR_FILE_PATH} app.jar

# 실행 명령 정의
ENTRYPOINT ["java", "-jar", "app.jar"]
#ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]