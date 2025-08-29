# [Lv5] Swift로 숫자야구 게임 만들기

## 요구사항

2번 게임 기록 보기의 경우 완료한 게임들에 대해 시도 횟수를 보여줍니다.

```swift
// 예시
환영합니다! 원하시는 번호를 입력해주세요.
1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기
2 // 2번 게임 기록 보기 입력

< 게임 기록 보기 >
1번째 게임 : 시도 횟수 - 14
2번째 게임 : 시도 횟수 - 9
3번째 게임 : 시도 횟수 - 12
.
.
.
```

코드 뼈대는 다음과 같습니다.

```swift
class 혹은 struct {

	let(var) recordManager = RecordManager() // 기록을 관리하는 인스턴스 생성
	
	func start() {
    while XX { 
	    switch 입력값 {
		    case 
			    // 1을 입력한 케이스
			    ...
			    // trialCount는 1회 게임에서의 시도 횟수
			    recordManager.add(trialCount: trialCount) // add 함수 구현하기
		    case 
			    // 2을 입력한 케이스
			    ...
			    recordManager.showRecords() // showRecords 함수 구현하기
		    case 
			    // 3을 입력한 케이스
		    default
	    }
    }
	}
}
```

## 변환점

Lv4에서는 기본적인 메뉴 구성을 만들었다면, Lv5에서는 게임 기록 보기 기능(case 2번) 을 새로 구현했다.

class BaseballGame 상단에 recordManager 객체를 생성하고, 별도의 RecordManager 클래스를 추가하였다. 이 클래스는 게임 시도 횟수를 저장하는 add() 메소드와, 저장된 기록을 출력하는 showRecords() 메소드로 구성된다.


## 해결과정

startGame() 함수에서 attempt 변수를 통해 매 시도마다 카운트가 올라가는 것을 확인했다. 게임이 종료되면 attempt를 Int 타입으로 반환하도록 수정하였다.

메뉴 case 1번에서 let trialCount = startGame()을 호출해 반환값을 받아오고, 이어서 recordManager.add(trialCount: trialCount)로 기록을 저장하도록 만들었다.


showRecords() 함수는 게임 기록이 전혀 없는 경우와, 최소 1회 이상 기록이 존재하는 경우를 구분하여 출력하도록 했다. records 배열을 빈 배열로 초기화한 뒤, 반복문을 통해 index를 증가시키며 각 게임의 시도 횟수를 보여주도록 작성했다. 이때 게임 번호는 index + 1, 시도 횟수는 records[index]를 이용하여 출력한다.
