//
//  ArticleData.swift
//  ImageApp
//
//  Created by Kresimir Ivanjko on 23.03.2023..
//

import Foundation

struct  ArticleData: Codable {
    let title: String
    let urlToImage: String?
}



/*
 "status": "ok",
     "totalResults": 11588,
     "articles": [{
             "source": {
                 "id": null,
                 "name": "New York Post"
             },
             "author": "FOX Weather",
             "title": "Bomb cyclone kills at least 2 in California as storm batters state",
             "description": "Two people were killed in the Bay Area Tuesday when trees fell across their cars during ferocious wind gusts up to 65 mph in the region.",
             "url": "https://nypost.com/2023/03/22/bomb-cyclone-kills-at-least-2-in-california-as-storm-batters-state/",
             "urlToImage": "https://nypost.com/wp-content/uploads/sites/2/2023/03/NYPICHPDPICT000008623796.jpg?quality=75&strip=all&w=1024",
             "publishedAt": "2023-03-22T18:53:11Z",
             "content": "At least two people were killed when a bomb cyclone slammed into California on Tuesday, bringing destructive wind gusts, heavy rain, flash flooding and mountain snow.\r\nA driver was killed by a fallin… [+5358 chars]"
         },
 */
