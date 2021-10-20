//
//  ViewController.swift
//  JSONDecoding
//
//  Created by Hugo Pinheiro on 20/10/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        get()
    }

   func get()
    {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments")!
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            do {
                let users = try JSONDecoder().decode([Users].self, from: data!)
                for user in users
                {
                   print("ID: \(user.id), title: \(user.name), email: \(user.email), body: \(user.body)")
                }
            }
            catch
            {
                print("Error ao obter os dados")
            }
        }.resume()
    }
}

struct Users: Decodable
{
   let id: Int
   let name: String
   let email: String
   let body:String
}
