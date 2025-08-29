# [Lv1] Swift로 숫자야구 게임 만들기

## 요구사항

1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다.

정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)

```swift
// main.swift 파일
// 프로젝트 생성시 자동 생성됨

let game = BaseballGame()
game.start() // BaseballGame.swift 만들어서 BaseballGame 인스턴스를 만들고 start 함수를 구현하기


// BaseballGame.swift 파일 생성
class 혹은 struct {
	func start() {
		let answer = makeAnswer() // 정답을 만드는 함수
	}
	
	func makeAnswer() -> Int {
		// 함수 내부를 구현하기
	}
}
```

## 해결과정

주어진 코드 뼈대에서 main.swift와 BaseballGame.swift를 분리하고 있음. BaseballGame에서 설계도(class)를 만들고, 메인에서 game 인스턴스를 만들어서 start 함수를 실행시키자.

뼈대코드를 다시 보면, class BaseballGame안에 start()와 makeAnswer()가 주어진다. start()에서는 answer에 makeAnswer()를 실행시켜서 만든 결과를 담는걸 보니, makeAnswer()에서 정답을 만들어서 answer를 리턴해줘야겠다.

1부터 9까지의 서로 다른 숫자 3개를 랜덤으로 뽑아야되는데, answer를 빈 Int 배열로 놓고,answer[0], answer[1], answer[2]로 랜덤숫자를 넣어준다.


```swift
class BaseballGame{
    
    func start() {
        print("투수가 마운드에 오릅니다.")
        let answer = makeAnswer()  // 정답 만드는 함수
        print("정답: \(answer[0]) \(answer[1]) \(answer[2])") // 뽑힌 숫자 확인테스트
    }
    
    func makeAnswer() -> [Int] {
        var answer: [Int] = []
        
        while answer.count < 3 {
            let num = Int.random(in: 1...9)
        }
        return answer
    }
    
}
```

이렇게 만들었는데, 조건을 다시 확인해보니 세자리는 서로 다른 숫자여야 한다. contains() 함수를 사용해서, if !answer.contains(num) 이면, answer에 append 해준다.

num 은 랜덤으로 뽑히고-> 중복 검사 과정을 통과하면 answer에 append 되고, answer에 담긴 개수가 3개가 될 때 answer를 return 한다.

## 완성 코드

```swift
class BaseballGame{
    
    func start() {
        print("투수가 마운드에 오릅니다.")
        let answer = makeAnswer()  // 정답 만드는 함수
        print("정답: \(answer[0]) \(answer[1]) \(answer[2])") // 뽑힌 숫자 확인테스트
    }
    
    func makeAnswer() -> [Int] {
        var answer: [Int] = []
        
        while answer.count < 3 {
            let num = Int.random(in: 1...9)
            
            if !answer.contains(num) {
                answer.append(num)
            }
        }
        return answer
    }
    
}
```
