//
//  ImgDowloader.swift
//  home_work_1_month_5
//
//  Created by Аяз on 21/6/23.
//

import UIKit

enum ImageDownloader {
    static func downloadImage(with url: String, completion: @escaping (UIImage?) -> Void) {
        guard let imageURL = URL(string: url) else {
            completion(nil)
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            if let imageData = try? Data(contentsOf: imageURL) {
                let image = UIImage(data: imageData)
                DispatchQueue.main.async {
                    completion(image)
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
}
