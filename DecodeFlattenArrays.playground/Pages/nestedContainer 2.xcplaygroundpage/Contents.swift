import Foundation


struct User: Decodable {
  let id: Int
  let email: String
  let isSubscribedToNewsletter: Bool

  enum OuterKeys: String, CodingKey {
    case id, preferences
    case contactInfo = "contact_info"
  }

  enum ContactKeys: String, CodingKey {
    case email
  }

  enum PreferencesKeys: String, CodingKey {
    case contact
  }

  enum ContactPreferencesKeys: String, CodingKey {
    case newsletter
  }

  init(from decoder: Decoder) throws {
    let outerContainer = try decoder.container(keyedBy: OuterKeys.self)
    let contactContainer = try outerContainer.nestedContainer(keyedBy: ContactKeys.self,
                                                              forKey: .contactInfo)
    let preferencesContainer = try outerContainer.nestedContainer(keyedBy: PreferencesKeys.self,
                                                                  forKey: .preferences)
    let contactPreferencesContainer = try preferencesContainer.nestedContainer(keyedBy: ContactPreferencesKeys.self,
                                                                               forKey: .contact)

    self.id = try outerContainer.decode(Int.self, forKey: .id)
    self.email = try contactContainer.decode(String.self, forKey: .email)
    self.isSubscribedToNewsletter = try contactPreferencesContainer.decode(Bool.self, forKey: .newsletter)
  }
}

let jsonString = """
{
  "id": 10,
  "contact_info": {
    "email": "test@test.com"
  },
  "preferences": {
    "contact": {
      "newsletter": true
    }
  }
}
"""

if let jsonData = jsonString.data(using: .utf8) {
    do {
        let myStruct = try JSONDecoder().decode(User.self, from: jsonData)
        print("Category 0 Subcategories: \(myStruct.email)")
        print("Category 1 Subcategories: \(myStruct.id)")
    } catch {
        print("Error decoding JSON: \(error)")
    }
}
