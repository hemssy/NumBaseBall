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
