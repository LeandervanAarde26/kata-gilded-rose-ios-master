public class Item: Equatable {
    
    var name: String = ""
    var sellIn: Int = 0
    var quality: Int = 0
    
    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
    
}

public func ==(lhs: Item, rhs: Item) -> Bool {
    return lhs.name == rhs.name
        && lhs.sellIn == rhs.sellIn
        && lhs.quality == rhs.quality
}
