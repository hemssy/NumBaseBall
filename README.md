# [fix] Swift로 숫자야구 게임 만들기

## 변경 전

```swift
    func ABS(guess: [Int]) -> (Int, Int) {
        var strike = 0
        var ball = 0
        
        for i in 0..<3 {
            if guess[i] == answer[i] {
                strike += 1
            } else {
                // 자리 다르고 숫자만 맞는 경우
                for j in 0..<3 {
                    if guess[i] == answer[j] {
                        ball += 1
                        break
                    }
                }
            }
        }
        
        return (strike, ball)
    }
```

## 변경 후

```swift
    func ABS(guess: [Int]) -> (Int, Int) {
        var strike = 0
        var ball = 0
        
        for i in 0..<3 {
            if guess[i] == answer[i] {
                strike += 1
            } else if answer.contains(guess[i]) {
                ball += 1
            }
        }
        
        return (strike, ball)
    }
```


contains 함수를 사용해서 볼 판정 구문의 else if를 간략화하였다.












