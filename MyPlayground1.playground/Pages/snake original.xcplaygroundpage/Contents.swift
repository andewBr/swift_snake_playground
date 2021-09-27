
import Foundation

struct Point {
    let x: Int
    let y: Int
}

enum Actor: Int {
    case tile = 0
    case apple = 1
    case snake = 2
    
    var symbol: String {
        switch self {
        case .tile: return " "
        case .apple: return "🍎"
        case .snake: return "✅"
        }
    }
}

struct SnakeLocation {
    var snakeSize:Int
    var snakeHead:Int
}


struct Field {
    let rows: Int = 5
    let inRow: Int = 5
    
    private(set) var matrix: [Int]
    
    init(rows: Int, inRow: Int) {
        matrix = [Int](repeating: 0, count: rows * inRow )
    }
    
    mutating func addApple(inPoint point: Point) {
        let index = point.x * point.y
        matrix[index] = Actor.apple.rawValue
    }
    
    func intercecs(with location: SnakeLocation, point: Point) -> Bool {
        let index = point.x * point.y
        return location.snakeHead == index
    }
}


class FieldIterator: IteratorProtocol {
    let inRow: Int = 5
    let row: Int = 5
    let matrix: [Int]
    private var pointer: Int
    
    init(_ rows: Int, _ inRow: Int, _ matrix: [Int]) {
        pointer = 0
        self.matrix = matrix
    }
    
    func next() -> Point? {
        if (matrix.count < pointer) { return nil }
        self.pointer += 1

        fatalError()
    }
}

var matrix = [Int](repeating: 0, count: 5 * 5 )


