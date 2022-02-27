//
//  ReviewList.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/12/01.
//

import SwiftUI
import Amplify
import AWSPluginsCore

struct ReviewList: View {
    @Binding var showList: Bool
//    @State var reviews:[Review] = []
//    @State var reviewImages:[String:Data] = [:]
    @State var selectedReview: Review?
    @State var showReview = false
    @EnvironmentObject var viewModel: ReviewListViewModel
    
    var recipeId: String
    
    func load(){
        self.viewModel.reviews = []
        let r = Review.keys
        var predicate = QueryPredicateGroup.init()
        predicate = predicate.and(r.recipe == self.recipeId)
        Amplify.API.query(request: .paginatedList(Review.self, where: predicate, limit: 10)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let reviews):
                    self.viewModel.currentPage = reviews
                    reviews.forEach{review in
                        Amplify.Storage.downloadData(key: review.image) { result in
                            switch result {
                            case .success(let imageData):
                                DispatchQueue.main.async{
                                    self.viewModel.reviewImages[review.id] = imageData
                                    self.viewModel.reviews.append(review)
                                }
                            case .failure(let error):
                                print("Failed to download image data - \(error)")
                            }
                        }
                    }
                    break
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
            }
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView (.vertical, showsIndicators: false) {
//                let adPlacement: Int = 5
                LazyVStack {
                    ForEach(0..<self.viewModel.reviews.count, id: \.self) { i in
                        CardView(review: self.viewModel.reviews[i])
                            .onTapGesture {
                                selectedReview = self.viewModel.reviews[i]
                                withAnimation {
                                    showReview = true
                                }
                            }
                            .onAppear {
                                if i == self.viewModel.reviews.count-1 {
                                    self.viewModel.listNextPage()
                                }
                            }
                        BannerAd(unitID: Constants.bannerAdId)
                            .background(.blue)
                    }
                }
                .padding(.top, 32)
            }
            .opacity(showReview ? 0 : 1)
            .onAppear {
                if (self.viewModel.reviews.count == 0) {
                    load()
                }
            }
            .overlay(
                Button(action: {
                    withAnimation(.spring()){
                        showList = false
                    }
                }) {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.leading,25)
                        .padding(.top,25)
                },
                alignment: .topLeading
            )
            
            if showReview {
                if let review = selectedReview {
                    StoryView(
                        showReview: $showReview,
                        reviewImage: viewModel.reviewImages[review.id] ?? Data(),
                        reviewData: review
                    )
                    .ignoresSafeArea(.all)
                    .transition(.move(edge:.bottom))
                }
            }
        }
        .background(.black)
    }
    
    @ViewBuilder
    func CardView(review: Review)->some View {
        VStack(alignment: .leading, spacing: 12) {
            GeometryReader{proxy in
                let size = proxy.size
                
                if let uiimage = UIImage(data: viewModel.reviewImages[review.id] ?? Data()) {
                    Image(uiImage: uiimage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .cornerRadius(15)
                }
            }
            .frame(height: 250)
        }
        .padding()
    }
}

//struct ReviewList_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewList(recipeId: "")
//    }
//}
