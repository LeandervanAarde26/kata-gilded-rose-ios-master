
public class GildedRose{
    
    public static func updateQuality(items: Array<Item>) -> [Item] {
        //These are all the items that there are
        let items = items
        
        for i in 0 ..< items.count {
            print(" ONE \(items[i].name) \t SELL IN \(items[i].sellIn) \t QUALITY \(items[i].quality)")
            nameCheck(item: items[i])
            print(" ONE \(items[i].name) \t SELL IN \(items[i].sellIn) \t QUALITY \(items[i].quality)")
            
        }
        
        return items
    }
    
    
    public static func nameCheck(item: Item){
        switch item.name {
        case "Backstage passes to a TAFKAL80ETC concert" :
            item.sellIn -= 1
            if(item.quality < 50){
                item.quality = item.sellIn < 10 && item.sellIn > 4
                ? item.quality + 2
                :item.sellIn < 5 && item.sellIn >= 0
                ? item.quality + 3
                : item.sellIn <= 0
                ? 0 :
                item.quality + 1
            }
            break
        case "Aged Brie":
            if(item.quality <= 50){
                item.sellIn = item.sellIn - 1
                if(item.quality >= 50){
                    item.quality = 50
                } else {
                    item.quality = item.sellIn < 1
                    ? item.quality >= 49
                    ? 50
                    : item.quality + 2
                    : item.quality + 1
                }
            } else{
               
            }
            break
        case "Sulfuras, Hand of Ragnaros":
            if(item.quality < 50){
                item.quality += 1
            }
            break
        default:
            updateQualities(item: item)
        }
    }
    

    public static func updateQualities(item: Item){
        item.sellIn = item.sellIn - 1
        
        switch item.quality{
        case _ where item.quality <= 0:
            item.quality = 0
            break
        case _ where item.quality < 50:
            item.quality =  item.sellIn <=  0
            ? item.quality - 2
            : item.quality - 1
            break
        case _ where item.quality > 0:
            item.quality =  item.sellIn <=  0
            ? item.quality - 2
            : item.quality - 1
            break
        default:
            if item.quality <= 0 {
                item.quality = 0
            } else {
                item.quality = item.sellIn <= 0
                    ? item.quality - 2
                    : item.quality - 1
            }
            break
        }
    }
}
