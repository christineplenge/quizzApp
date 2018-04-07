import GameKit

class RandomQuestionIndex {
    var questionsLeft: [Int] = [Int]()
    
    init() {
        self.questionsLeft = [Int]()
    }
    
    func randomQuestionGenerator(max: Int) -> () -> Int {
        return {
            if self.questionsLeft.count == 0 {
                self.questionsLeft = Array(0 ... max) // Resets questionLeft counter
            }
        
            let index = Int(arc4random_uniform(UInt32(self.questionsLeft.count)))
            return self.questionsLeft.remove(at: index)
        }
    }
}
