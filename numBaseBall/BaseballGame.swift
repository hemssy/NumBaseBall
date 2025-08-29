import Foundation

class BaseballGame {
    private var answer: [Int] = [ ]
    private var nowRunning = true
    private let recordManager = RecordManager()
    
    // startMenu 함수: 메뉴에서 숫자 선택
    func startMenu() {
        
        while nowRunning {
            
            // 안내문구 출력
            print("환영합니다! 원하시는 번호를 입력해주세요.")
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            print("선택: ", terminator: "")
            
            // 사용자 입력받기
            guard let line = readLine() else {
                print("잘못된 입력입니다. 다시 입력해주세요. \n")
                continue
            }
            
            let input = line.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // === switch문으로 입력값 처리 ===
            switch input {
            case "1":
                let trialCount = startGame()
                recordManager.add(trialCount: trialCount)
                
            case "2":
                recordManager.showRecords()
                
            case "3":
                // 게임종료 함수 들어갈 예정
                print("\n < 숫자 야구 게임을 종료합니다 >")
                nowRunning = false
                
            default:
                print("올바른 숫자를 입력해주세요! \n")
                continue
            }
            // === switch문 break ===
            
        }
        
    }
    

    // startGame 함수: 게임 진행
    func startGame() -> Int{
        
        print("\n< 게임을 시작합니다 >")
        print("타자가 타석에 들어섭니다.")
        
        // 정답 만들고 저장해둠
        answer = makeAnswer()
        
        // print("정답: \(answer[0]) \(answer[1]) \(answer[2])") // 디버깅용 정답확인
        
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
                print("잘못된 입력입니다. 0~9 중 서로 다른 숫자 3개를 공백없이 입력해주세요.(첫 자리는 0이 될 수 없습니다.)")
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
                print("스윙삼진! 게임이 종료됩니다.\n")
                return attempt  //void -> Int 반환
            }
        }
    }
    
    
    // makeAnswer 함수: 첫자리는 1~9,나머지는 0~9 사이의 서로 다른 세 숫자로 정답 생성
    func makeAnswer() -> [Int] {
        var answerArr: [Int] = []
        
        // 첫 자리: 1~9 공백없이 넣기
        let first = Int.random(in: 1...9)
        answerArr.append(first)
        
        
        // 나머지 자리: 0~9 공백없이 넣기
        while answerArr.count < 3 {
            let num = Int.random(in: 0...9)
            
            if !answerArr.contains(num) {
                answerArr.append(num)
            }
        }
        
        return answerArr
    }
    
    // parseGuess 함수: 사용자 입력을 3자리 정수 배열로 파싱하기
    func parseGuess(_ text: String) -> [Int] {
        
        guard text.count == 3 else { return [] }
        
        var numbers: [Int] = []
        var index = 0 // index는 현재 몇 번째 글자인지 확인용도
        
        for t in text {
            // 숫자 아니면 안됨
            guard let num = Int(String(t)) else { return [] }
            
            // 0~9 범위 벗어나면 안됨
            if num < 0 || num > 9 { return [] }
            
            // 첫 자리 0 안됨
            if index == 0 && num == 0 { return [] } // 첫 번째 글자일 때 + 숫자가 0일 때
            
            // 중복이면 안됨
            if numbers.contains(num) { return [] }
            
            numbers.append(num)
            
            index += 1
        }
        
        return numbers
    }
    
    // ABS 함수: 볼/스트라이크 판정함
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

