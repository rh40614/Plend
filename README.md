# Plend

## plend는 공간대여 중개 플랫폼입니다.

- 호스트  
  자신의 공간을 등록하고 이용자의 예약, 문의를 관리할 수 있습니다.
- 이용자  
  사용하고자 하는 장소를 검색, 예약하고 리뷰를 등록할 수 있습니다.
- 관리자  
  호스트의 공간 등록을 검토하고 이용자와 호스트간의 연결, 문제해결을 수행합니다.


## 실행방법

- OS
  - window10
- Compiler
  - JavaSE-1.8
- Server
  - Tomcat 8.5
- Browser Support
  - Chrome 104.0.5112.82



## 주요기능

- 지도 API
  - 이용자를 위한 대여 공간의 정확한 위치 표현
- 해시태그 기반 장소 검색, 추천 시스템
  - 태그를 통해 장소의 검색, 추천 서비스 제공
- 예약 시스템 구현
  - 자체 예약 시스템 구현을 통한 예약 관리
- 결제 API
  - 부트페이를 통한 결제 시스템



## Frontend

<img alt="HTML" src ="https://img.shields.io/badge/HTML5-E34F26.svg?&style=for-the-badge&logo=HTML5&logoColor=white"/> <img alt="CSS" src ="https://img.shields.io/badge/CSS3-1572B6.svg?&style=for-the-badge&logo=CSS3&logoColor=white"/> <img alt="JavaScript" src ="https://img.shields.io/badge/JavaScriipt-F7DF1E.svg?&style=for-the-badge&logo=JavaScript&logoColor=black"/> <img alt="jQuery" src ="https://img.shields.io/badge/jQuery-0769AD.svg?&style=for-the-badge&logo=jQuery&logoColor=white"/> <img alt="Bootstrap" src ="https://img.shields.io/badge/Bootstrap-7952B3.svg?&style=for-the-badge&logo=Bootstrap&logoColor=white"/>

- 부트스트랩을 사용해 디자인 했습니다.
- DOM 이벤트는 주로 jQuery를 사용해 처리했습니다.
- JavaScript로 다음 주소API를 구현했습니다.

## Backend

<img alt="Spring" src ="https://img.shields.io/badge/Spring-6DB33F.svg?&style=for-the-badge&logo=Spring&logoColor=white"/> <img alt="Spring" src ="https://img.shields.io/badge/Java-E34F26.svg?&style=for-the-badge&logoColor=white"/> <img alt="MyBatis" src ="https://img.shields.io/badge/MyBatis-0769AD.svg?&style=for-the-badge&logoColor=white"/>

- MVC 디자인 패턴을 적용했습니다.
- Spring Security로 회원의 비밀번호 암호화했습니다.
- URL로 보안이 필요한 페이지로 이동하지 못하게 Interceptor 기능 사용했습니다.
- Scheduler 사용 매시 정각 예약 내용을 정리했습니다.
- naver, kakao 소셜 로그인, 회원가입 기능을 구현했습니다.

## RDBMS

<img alt="MySQL" src ="https://img.shields.io/badge/MySQL-4479A1.svg?&style=for-the-badge&logo=MySQL&logoColor=white"/>



## 보완해야할 점

## 향후 추가하고싶은 기능

- 1대1 채팅
- 쿠폰 할인
