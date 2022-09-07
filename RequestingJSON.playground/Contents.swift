import UIKit

struct Book: Decodable {
    let title: String
    let author: String
}

if let url = URL(string: "https://bit.ly/3sspdFO") {
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            if let books = try? JSONDecoder().decode([Book].self, from: data) {
                print(books)
            } else {
                print("Invalid response")
            }
        } else if let error = error {
            print("HTTP Request Failed \(error)")
        }
    }
    task.resume()
}
