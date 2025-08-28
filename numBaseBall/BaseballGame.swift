import Foundation

class BaseballGame {
    private var answer: [Int] = []

    func start() {
        print("< 게임을 시작합니다 >")
        print("타자가 타석에 들어섭니다.")

        // 정답 만들고 저장해둠
        answer = makeAnswer()

        // print("정답: \(answer[0]) \(answer[1]) \(answer[2])") // 디버깅용

        var attempt = 0

        while true {
            attempt += 1 // 공 개수
            print("\n[\(attempt)구] 숫자를 입력하세요: ", terminator: "")

            // 입력 읽기
            guard let line = readLine() else {
                print("잘못된 입력입니다. 다시 입력해주세요.")
                continue
            }

            // 파싱
            let guess = parseGuess(line)

            if guess.count != 3 {
                print("잘못된 입력입니다. 0~9 중 서로 다른 숫자 3개를 공백없이 입력해주세요. 첫 자리는 0이 될 수 없습니다.")
                continue
            }

            // 판정
            let (strike, ball) = ABS(guess: guess)

            if strike == 0 && ball == 0 {
                print("Nothing")
            } else {
                print("\(strike) 스트라이크 \(ball) 볼")
            }

            // 3스트라이크면 게임 종료
            if strike == 3 {
                print("스윙삼진! 게임이 종료됩니다.")
                break 
            }
        }
    }

    // 첫자리는 1~9,나머지는 0~9 사이의 서로 다른 세 숫자로 정답 생성
    func makeAnswer() -> [Int] {
        var answerArr: [Int] = []
        
        // 첫 자리: 1~9 공백없이 넣기
        let first = Int.random(in: 1...9)
        answerArr.append(first)

        
        // 두번째,세번째 자리: 0~9 공백없이 넣기
        while answerArr.count < 3 {
            let num = Int.random(in: 0...9)
            
            if !answerArr.contains(num) {
                answerArr.append(num)
            }
        }
        
        return answerArr
    }

    // 사용자 입력을 3자리 정수 배열로 파싱하기
    func parseGuess(_ text: String) -> [Int] {
        
        guard text.count == 3 else { return [] }

        var numbers: [Int] = []
        var index = 0

        for t in text {
            // 숫자 아니면 안됨
            guard let num = Int(String(t)) else { return [] }

            // 0~9 범위 벗어나면 안됨
            if num < 0 || num > 9 { return [] }
            
            // 첫 자리 0 안됨
            if index == 0 && num == 0 { return [] }

            // 중복이면 안됨
            if numbers.contains(num) { return [] }

            numbers.append(num)
            
            index += 1
        }

        return numbers
    }

    // 공 판정은 ABS가 합니다!
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
}

