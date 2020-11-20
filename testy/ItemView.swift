import SwiftUI
import KingfisherSwiftUI

struct ItemView: View {
    @Environment(\.openURL) var openURL
    
    var item: DisplayItem
    
    var body: some View {
        HStack {
            Button(action: {
                openURL(URL(string: item.viewItemURL)!)
            }, label: {
                KFImage(URL(string: item.thumbnailURL)!)
            })
            .buttonStyle(PlainButtonStyle())
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                Text(item.categoryName)
                    .font(.footnote)
                HStack{
                    Text("Current Price: ")
                    Text(item.price)
                    Text(item.currencyUnits)
                }
                HStack {
                    Text("Location: \(item.location), \(item.country)")
                    Text("Ships to: \(item.shipToLocation)")
                }
            }
        }
        .padding()
    }
}

struct ItemView_Previews: PreviewProvider {
    @Environment(\.openURL) var openURL
    
    static var previews: some View {
        ItemView(
            item: DisplayItem(itemID: "1234567890", thumbnailURL: "https://thumbs2.ebaystatic.com/m/mYuDqtjhtOPBpAWm4hfzmBw/140.jpg", price: "1.23", currencyUnits: "USD", title: "Harry Potter And The Order Of The Phoenix , Paperback , Rowling, J.K.", categoryName: "Children & YA Fiction", location: "Denver,CO,USA", country: "US", shipToLocation: "Worldwide", viewItemURL: "https://www.ebay.com/itm/Harry-Potter-And-Order-Phoenix-Paperback-Rowling-J-K-/353265398077"
            ))
    }
}
