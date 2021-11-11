//
//  Detail.swift
//  swiftuitest
//
//  Created by Koshi Yukitake on 2021/11/07.
//

import SwiftUI

private struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {
        
    }
}

struct OffsetableScrollView<T: View>: View {
    let axes: Axis.Set
    let showsIndicator: Bool
    let offsetChanged: (CGPoint) -> Void
    let content: T
    
    init(
        axes: Axis.Set = .vertical,
        showsIndicator: Bool = true,
        offsetChanged: @escaping (CGPoint) -> Void = {_ in },
        @ViewBuilder content: () -> T
    ){
        self.axes = axes
        self.showsIndicator = showsIndicator
        self.offsetChanged = offsetChanged
        self.content = content()
    }
    
    var body: some View {
        ScrollView(
            axes,
            showsIndicators: showsIndicator
        ) {
            GeometryReader{ proxy in
                Color.clear.preference(
                    key: OffsetPreferenceKey.self,
                    value: proxy.frame(in: .named("ScrollView")).origin
                )
            }
            .frame(width:0, height:0)
            content
        }
        .coordinateSpace(name: "ScrollView")
        .onPreferenceChange(OffsetPreferenceKey.self, perform: offsetChanged)
    }
}

struct Detail: View {
    @Binding var selectedItem: RecipeData
    @Binding var show: Bool
    @Binding var header:Data
    var animation: Namespace.ID
    var screen = UIScreen.main.bounds.size
    
    @State var verticalOffset: CGFloat = 0.0
    
    var body: some View {
            
        if let image = UIImage(data:header) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image\(selectedItem.id)", in: animation)
                .padding()
        }
            
        Color.black
            .opacity(verticalOffset < 0 ? 0.5 : 0)
            .matchedGeometryEffect(id: "color\(selectedItem.id)", in: animation)
            
        OffsetableScrollView { point in
            verticalOffset = point.y
        } content: {
            VStack {
                HStack {
                    Text(selectedItem.title)
                        .font(.title)
                        .padding(.top,64)
                    Spacer()
                }
                
                HStack {
                    Text("材料")
                    Spacer()
                }
                
                HStack {
                    Text(selectedItem.materials)
                    Spacer()
                }
                
                ForEach(0..<50){ i in
                    HStack {
                        Text("手順\(i)")
                        Spacer()
                    }
                    HStack {
                        Text("aaaaaaaaa")
                        Spacer()
                    }
                    
                }
            }
            .padding(.horizontal,32)
        }
        .frame(width:screen.width)
        .overlay(
            Button(action: {
                // closing
                withAnimation(.spring()){
                    show.toggle()
                }
            }) {
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.leading,25)
                    .padding(.top,25)
            }
            ,alignment: .topLeading
        )
//        ScrollView {
            
//        }
        
    }
}

//struct Detail_Previews: PreviewProvider {
//    static var previews: some View {
//        Detail()
//    }
//}
