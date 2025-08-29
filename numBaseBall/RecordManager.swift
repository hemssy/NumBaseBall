import Foundation

// 기록 보여주기
class RecordManager {
    private var records: [Int] = [ ]
    
    func add(trialCount: Int) {
        records.append(trialCount)
    }
    
    func showRecords() {
        print("\n< 게임 기록 보기 >")
        
        //게임 0번 했을 때
        if records.isEmpty {
            print("기록이 없습니다. 메뉴로 돌아갑니다. \n")
            return
        }
        
        //게임 1번이상 했을 때
        var index = 0
        while index < records.count {
            let gameNumber = index + 1
            let tries = records[index]
            print("\(gameNumber)번째 게임: 시도 횟수 - \(tries)")
            index += 1
        }
        print("")
    }
}

