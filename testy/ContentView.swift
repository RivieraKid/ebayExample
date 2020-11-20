import SwiftUI
import Foundation

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    let findItemsByKeywordsResponse: [FindItemsByKeywordsResponse]
}

// MARK: - FindItemsByKeywordsResponse
struct FindItemsByKeywordsResponse: Codable {
    let ack: [String],
    let version: [String]
    let timestamp: [String]
    let searchResult: [SearchResult]
    let paginationOutput: [PaginationOutput]
    let itemSearchURL: [String]
}

// MARK: - PaginationOutput
struct PaginationOutput: Codable {
    let pageNumber: [String]
    let entriesPerPage: [String]
    let totalPages: [String]
    let totalEntries: [String]
}

// MARK: - SearchResult
struct SearchResult: Codable {
    let count: String
    let item: [Item]
    
    enum CodingKeys: String, CodingKey {
        case count = "@count"
        case item
    }
}

// MARK: - Item
struct Item: Codable {
    let itemID: [String]
    let title: [String]
    let globalID: [GlobalID]
    let primaryCategory: [AryCategory]
    let galleryURL: [String]?
    let viewItemURL: [String]
    let productID: [ProductID]?
    let autoPay: [String]
    let postalCode: [String]?
    let location: [String]
    let country: [Country]
    let shippingInfo: [ShippingInfo]
    let sellingStatus: [SellingStatus]
    let listingInfo: [ListingInfo]
    let returnsAccepted: [String]
    let condition: [Condition]?
    let isMultiVariationListing: [String]
    let topRatedListing: [String]
    let paymentMethod: [PaymentMethod]?
    let subtitle: [String]?
    let galleryPlusPictureURL: [String]?
    let secondaryCategory: [AryCategory]?
    let discountPriceInfo: [DiscountPriceInfo]?
    let charityID: [String]?
    
    enum CodingKeys: String, CodingKey {
        case itemID = "itemId"
        case title
        case globalID = "globalId"
        case primaryCategory, galleryURL, viewItemURL
        case productID = "productId"
        case autoPay, postalCode, location, country, shippingInfo, sellingStatus, listingInfo, returnsAccepted, condition, isMultiVariationListing, topRatedListing, paymentMethod, subtitle, galleryPlusPictureURL, secondaryCategory, discountPriceInfo
        case charityID = "charityId"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let conditionID: [String]
    let conditionDisplayName: [ConditionDisplayName]
    
    enum CodingKeys: String, CodingKey {
        case conditionID = "conditionId"
        case conditionDisplayName
    }
}

enum ConditionDisplayName: String, Codable {
    case acceptable = "Acceptable"
    case brandNew = "Brand New"
    case good = "Good"
    case likeNew = "Like New"
    case new = "New"
    case used = "Used"
    case veryGood = "Very Good"
}

enum Country: String, Codable {
    case us = "US"
}

// MARK: - DiscountPriceInfo
struct DiscountPriceInfo: Codable {
    let originalRetailPrice: [OriginalRetailPrice]
    let pricingTreatment: [String]
    let soldOnEbay: [String]
    let soldOffEbay: [String]
}

// MARK: - OriginalRetailPrice
struct OriginalRetailPrice: Codable {
    let currencyID: CurrencyID
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case currencyID = "@currencyId"
        case value = "__value__"
    }
}

enum CurrencyID: String, Codable {
    case usd = "USD"
}

enum GlobalID: String, Codable {
    case ebayUs = "EBAY-US"
}

// MARK: - ListingInfo
struct ListingInfo: Codable {
    let bestOfferEnabled: [String]
    let buyItNowAvailable: [String]
    let startTime: [String]
    let endTime: [String]
    let listingType: [ListingType]
    let gift: [String]
    let watchCount: [String]?
    let buyItNowPrice: [OriginalRetailPrice]?
    let convertedBuyItNowPrice: [OriginalRetailPrice]?
}

enum ListingType: String, Codable {
    case auction = "Auction"
    case auctionWithBIN = "AuctionWithBIN"
    case fixedPrice = "FixedPrice"
    case storeInventory = "StoreInventory"
}

enum PaymentMethod: String, Codable {
    case payPal = "PayPal"
}

// MARK: - AryCategory
struct AryCategory: Codable {
    let categoryID: [String]
    let categoryName: [CategoryName]
    
    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case categoryName
    }
}

enum CategoryName: String, Codable {
    case artPosters = "Art Posters"
    case audiobooks = "Audiobooks"
    case childrenYAFiction = "Children & YA Fiction"
    case dvDsBluRayDiscs = "DVDs & Blu-ray Discs"
    case harryPotter = "Harry Potter"
    case otherCCGItems = "Other CCG Items"
    case otherGames = "Other Games"
    case postersPrints = "Posters & Prints"
    case tradingCardSingles = "Trading Card Singles"
    case videoGames = "Video Games"
    case antiquarianAndCollectible = "Antiquarian & Collectible"
}

// MARK: - ProductID
struct ProductID: Codable {
    let type: TypeEnum
    let value: String
    
    enum CodingKeys: String, CodingKey {
        case type = "@type"
        case value = "__value__"
    }
}

enum TypeEnum: String, Codable {
    case referenceID = "ReferenceID"
}

// MARK: - SellingStatus
struct SellingStatus: Codable {
    let currentPrice: [OriginalRetailPrice]
    let convertedCurrentPrice: [OriginalRetailPrice]
    let sellingState: [SellingState]
    let timeLeft: [String]
    let bidCount: [String]?
}

enum SellingState: String, Codable {
    case active = "Active"
}

// MARK: - ShippingInfo
struct ShippingInfo: Codable {
    let shippingServiceCost: [OriginalRetailPrice]?
    let shippingType: [ShippingType]
    let shipToLocations: [ShipToLocation]
    let expeditedShipping: [String]
    let oneDayShippingAvailable: [String]
    let handlingTime: [String]
}

enum ShipToLocation: String, Codable {
    case worldwide = "Worldwide"
}

enum ShippingType: String, Codable {
    case calculated = "Calculated"
    case calculatedDomesticFlatInternational = "CalculatedDomesticFlatInternational"
    case flat = "Flat"
    case free = "Free"
    case freePickup = "FreePickup"
    case flatDomesticCalculatedInternational = "FlatDomesticCalculatedInternational"
}

// I'm using a separate struct with just the information I'm displaying to simplify the display code
struct DisplayItem {
    var itemID: String
    var thumbnailURL: String
    var price: String
    var currencyUnits: String
    var title: String
    var categoryName: String
    var location: String
    var country: String
    var shipToLocation: String
    var viewItemURL: String
}

struct ContentView: View {
    @Environment(\.openURL) var openURL

    @State private var itemList = [DisplayItem]()
    
    var body: some View {
        
        VStack(alignment: .leading) {
            List(itemList, id: \.itemID) { item in
                ItemView(openURL: _openURL, item: item)
            }
        }
        .onAppear {
            loadData()
        }
    }
    
    func loadData() {
        
        guard let url = URL(string: "https://svcs.ebay.com/services/search/FindingService/v1?OPERATION-NAME=findItemsByKeywords&SERVICE-VERSION=1.0.0&SECURITY-APPNAME=PalLal-TrendFin-PRD-27bc67f42-38aa3d7a&RESPONSE-DATA-FORMAT=JSON&REST-PAYLOAD&keywords=harry%20potter%20phoenix") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            // step 4
            
            var displayItemList = [DisplayItem]()
            self.itemList.removeAll()
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let decodedResponse = try decoder.decode(Result.self, from: data)
                        for itemsByKeywordResponse in decodedResponse.findItemsByKeywordsResponse {
                            if itemsByKeywordResponse.ack[0] == "Success" {
                                for searchResult in itemsByKeywordResponse.searchResult {
                                    for item in searchResult.item {
                                        // We finally have the items we're interested in
                                        var shipsToLocations = ""
                                        for (index, shipsTo) in item.shippingInfo.enumerated() {
                                            // Pull out all of the shipping destinations
                                            for loc in shipsTo.shipToLocations {
                                                shipsToLocations = "\(shipsToLocations)\(loc)"
                                                if index != item.shippingInfo.count {
                                                    shipsToLocations = "\(shipsToLocations), "
                                                }
                                            }
                                        }
                                        
                                        // Because the response from eBay is such a mess of arrays, I'm getting the values
                                        // separately to creating the new DisplayItem struct, as it makes things a bit clearer
                                        let itemID: String = item.itemID[0]
                                        let thumbnailURL: String = (item.galleryURL?[0]) ?? "https://developer.ebay.com/DevZone/assets/eBayDevLogo_sm.gif"
                                        let price: String = item.sellingStatus[0].currentPrice[0].value
                                        let currencyUnits: String = item.sellingStatus[0].currentPrice[0].currencyID.rawValue
                                        let title: String = item.title[0]
                                        let categoryName: String = item.primaryCategory[0].categoryName[0].rawValue
                                        let location: String = item.location[0]
                                        let country: String = item.country[0].rawValue
                                        let viewItemURL: String = item.viewItemURL[0]
                                        
                                        let displayItem = DisplayItem(
                                            itemID: itemID,
                                            thumbnailURL: thumbnailURL,
                                            price: price,
                                            currencyUnits: currencyUnits,
                                            title: title,
                                            categoryName: categoryName,
                                            location: location,
                                            country: country,
                                            shipToLocation: shipsToLocations,
                                            viewItemURL: viewItemURL)
                                        displayItemList.append(displayItem)
                                    }
                                }
                            }
                        }
                        self.itemList = displayItemList
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}
