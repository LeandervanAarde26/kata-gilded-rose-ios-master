
public class GildedRose{
    
    public static func updateQuality(items: Array<Item>) -> [Item] {
        let items = items
        for i in 0 ..< items.count {
            print(" ONE \(items[i].name) \t SELL IN \(items[i].sellIn) \t QUALITY \(items[i].quality)")
            nameCheck(item: items[i])
            print(" ONE \(items[i].name) \t SELL IN \(items[i].sellIn) \t QUALITY \(items[i].quality)")
        }
        return items
    }
    
    public static func nameCheck(item: Item){
        let amount = amountChecker(quantity: item.quality)
        switch item.name {
        case "Backstage passes to a TAFKAL80ETC concert" :
            item.sellIn -= 1
            let range1 = item.sellIn < 10 && item.sellIn > 4
            let range2 = item.sellIn < 5 && item.sellIn >= 0
            if(!amount){
                item.quality =
                range1 ? item.quality + 2
                : range2 ? item.quality + 3
                : item.sellIn <= 0 ? 0
                :item.quality + 1
            }
            break
        case "Aged Brie":
            item.sellIn = item.sellIn - 1
            if(!amount){
                item.quality +=
                item.sellIn < 1
                ?  2
                :  1
            } else {
                item.quality = 50
            }
            break
            
        case "Conjured Mana Cake":
            item.sellIn -= 1
            item.quality -= item.sellIn < 1 ? 4 : 2
            if(item.quality < 1){
                item.quality = 0
            }
      
        case "Sulfuras, Hand of Ragnaros":
            if(!amount){
                item.quality += 1
            }
            break
        default:
            updateQualities(item: item)
        }
    }
    
    public static func updateQualities(item: Item){
        item.sellIn = item.sellIn - 1
        let lessthanZeroChecker = item.sellIn <=  0
        ? 2
        : 1
        switch item.quality{
        case _ where item.quality <= 0:
            item.quality = 0
            break
        case _ where item.quality < 50:
            item.quality -= lessthanZeroChecker
            break
        case _ where item.quality > 0:
            item.quality -= lessthanZeroChecker
            break
        default:
            if item.quality <= 0 {
                item.quality = 0
            } else {
                item.quality -= lessthanZeroChecker
            }
            break
        }
    }
    
    public static func amountChecker(quantity: Int) -> Bool{
        if (quantity >= 49){
            return true
        } else {
            return false
        }
    }
}

