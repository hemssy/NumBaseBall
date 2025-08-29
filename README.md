# Swift로 숫자야구 게임 만들기

## 프로젝트 소개

Xcode Command Line Tool 로 만든 콘솔 프로그램으로, Lv1부터 Lv6까지 총 여섯단계에 걸쳐서 발전시킨 과제입니다.

> **각 레벨의 요구사항과 트러블슈팅 과정은 해당 레벨 브랜치의 리드미에서 확인할 수 있습니다!**

---

## 게임 룰 설명 ⚾ 
숫자야구 게임은 **두 명이 플레이하는 추리 게임**으로, **상대방이 설정한 3자리의 숫자를 맞추면 끝이 납니다.**

각 자리의 숫자와 위치가 맞으면 스트라이크, 숫자만 맞고 위치가 다르면 볼로 판정됩니다.

**투수(컴퓨터)** 는 투구전략 ```answer```를 생각해놓았고, **타자(사용자)** 가 투구전략 의도대로 3스트라이크를 기록하면 삼진아웃을 당하며 게임이 종료됩니다!

## 연습게임

아래 실행화면을 보면서 게임룰을 익혀봅시다! 


<img width="397" height="278" alt="스크린샷 2025-08-28 오후 12 29 31" src="https://github.com/user-attachments/assets/c9b3338b-b4c2-4a52-982c-b4169892c9a4" /> 



| 입력 숫자 | 판정    | 이유                               |
|-----------|---------|---------------------------------|
| 123       | 0S 1B   | 숫자 하나만 포함, 위치는 다름        |
| 234       | Nothing | 해당 숫자들이 전혀 포함되지 않음     |
| 156       | 1S 2B   | 한 자리 정답, 두 자리는 숫자만 맞음|
| 516       | 3S      | 세 자리 모두 정답! 게임 종료         |


---
## Stacks 🐈
### Environment
<img src="https://img.shields.io/badge/Xcode-1575F9.svg?style=for-the-badge&logo=Xcode&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">

### Development
<img src="https://img.shields.io/badge/Swift-F05138.svg?style=for-the-badge&logo=swift&logoColor=white">   

### OS
<img src="https://img.shields.io/badge/macOS-000000.svg?style=for-the-badge&logo=apple&logoColor=white">

---
## 실행 화면

![output-onlinegiftools](https://github.com/user-attachments/assets/71dc7429-4f1b-4937-b1c8-b07f5b7cb1f2)


---
## 구현 포인트 ☑️

### 정답을 생성하는 ```makeAnswer()```
- 빈 배열 ```answerArr``` 를 만들고, 첫자리는 1에서 9사이, 나머지 자리는 0에서 9사이 범위에서 ```Int.random(in:)``` 함수로 수를 뽑아 배열에 추가했습니다.
- 수를 뽑는 과정에서 중복을 막기 위해 ```contains()``` 함수를 사용했습니다.

### 사용자 입력을 검증하는 ```parseGuess()```
- 입력 문자열을 3자리 정수 배열로 파싱하는 함수입니다.
- 입력이 숫자인지 확인 -> 0~9 범위인지 확인 -> 첫 자리가 0인지 확인 -> 중복인지 확인 -> 배열에 추가 의 로직입니다.

### 사용자의 입력을 판정하는 ```ABS()```
- 실제 야구경기에 사용되는 ABS(자동 볼 판정 시스템) 을 함수로 만들었습니다!
- 사용자의 입력 ```guess``` 를 순회하면서 ```character``` 타입의 ```guess[i]``` 와 정답 배열 ```answer```의 ```answer[j]```를 비교합니다.

























