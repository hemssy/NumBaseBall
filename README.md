# [Lv3] Swift로 숫자야구 게임 만들기

## 요구사항

정답이 되는 숫자를 0에서 9까지의 서로 다른 3자리의 숫자로 바꿔주세요.

맨 앞자리에 0이 오는 것은 불가능합니다.
    
정답 규칙 변경/사용자 입력 규칙 변경/안내문구 수정하세요.

```swift
// BaseballGame.swift 파일

class 혹은 struct {
	func makeAnswer() -> Int {
		// Lv1에서 구현한 로직을 변경하기
	}
}
```

## 변환점

일단 makeAnswer()에서 < 첫 자리 / 두,세번째 자리 > 두가지 경우로 나눠서 Int.randome(in:)함수의 범위를 나눠줬다.

그리고, 사용자의 문자열 입력을 받아서 정수배열로 변환해서 넘겨주는 역할의 parseGuess()함수에 

if index == 0 && num == 0 이면 { return 빈배열 }조건을 추가했다.

