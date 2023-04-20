//
//  ViewController.swift
//  ImageApp
//
//  Created by Kresimir Ivanjko on 23.03.2023..
//

import UIKit

class ViewController: UIViewController {
    
    var articleList = [ArticleData]()

    @IBOutlet var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - Functions Call
        fetchdata()

    }
    
    // MARK: - Fetch Data
    
    func fetchdata() {
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-02-23&sortBy=publishedAt&apiKey=6b954d0842f1479c8f72c096a9ee6c6d")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil
            else {
                print("Error occured while accesing data")
                return
            }
            var newsFullList: NewsData?
            do
            {
                newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
            }
            catch {
                print("Error occured while decoding")
            }
            self.articleList = newsFullList!.articles
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        })
        dataTask.resume()
    }
}
    // MARK: - Get Image

extension UIImageView {
    
    func downLoadImage(from url: URL) {
        
        contentMode = .scaleAspectFit
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        })
        dataTask.resume()
    }
}

    // MARK: - Setup TableView

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!
        MyTableViewCell
        if articleList[indexPath.row].urlToImage != nil
        {
            let url = URL(string: articleList[indexPath.row].urlToImage!)
            cell.myImageView.downLoadImage(from: url!)
            cell.myImageView.contentMode = .scaleAspectFit
        }
        else {
            cell.myImageView.image = UIImage(named: "broken.image")
        }
        cell.myLabel1.text = articleList[indexPath.row].title
        return cell
    }
    
    
}

