//
//  ReviewListViewModel.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/12/26.
//

import Combine
import Amplify
import AWSPluginsCore
import Foundation

class ReviewListViewModel: ObservableObject {
    var currentPage: List<Review>?
    @Published var reviews:[Review] = []
    @Published var reviewImages:[String:Data] = [:]
    
    func listNextPage() {
//        print("aaa")
//        print(currentPage)
//        print(currentPage?.hasNextPage())
        if let current = currentPage, current.hasNextPage() {
            current.getNextPage { result in
                switch result {
                case .success(let reviews):
                    self.currentPage = reviews
                    reviews.forEach{review in
                        Amplify.Storage.downloadData(key: review.image) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.reviewImages[review.id] = imageData
                                    self.reviews.append(review)
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    }
                case .failure(let coreError):
                    print("Failed to get next page \(coreError)")
                }
            }
        }
    }
}
