//
//  StubView.swift
//  MiBancoAmiibo
//
//  Created by Juan Manuel Moreno on 30/08/23.
//

import SwiftUI

struct StubView: View {
    
    @ObservedObject var viewModel = StubViewModel()
    @State private var index = 0
    
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    private let images: [String] = ["Haruka_ofa_casual", "Chihaya_ofa_casual", "Yukiho_ofa_casual"]
    
    var body: some View {
        VStack {
            Text("Roof at Work")
            VStack {
//                NavigationStack {
//                    VStack {
//                        ZStack {
//                            ForEach(0..<images.count, id: \.self) { index in
//                                Image(images[index])
//                                    .frame(width: 12, height: 19)
//                                    .scaleEffect(currentIndex == index ? 1.2 : 0.8)
//                                    .offset(x: CGFloat(index - currentIndex) * 12 + dragOffset, y: 0)
//                                    .gesture(
//                                    DragGesture()
//                                        .onEnded({ value in
//                                            let threshold: CGFloat = 50
//                                            if value.translation.width > threshold {
//                                                withAnimation {
//                                                    currentIndex = max(0, currentIndex - 1)
//                                                }
//                                            } else {
//                                                withAnimation {
//                                                    currentIndex = min(images.count - 1, currentIndex + 1)
//                                                }
//                                            }
//                                        })
//                                    )
//                            }
//                        }
//                    }
//                }
//                .toolbar {
//                    ToolbarItem(placement: .bottomBar) {
//                        HStack {
//                            Button {
//                                withAnimation {
//                                    currentIndex = max(0, currentIndex - 1)
//                                }
//                            } label: {
//
//                            }
//                            Button {
//                                withAnimation {
//                                    currentIndex = min(images.count - 1, currentIndex + 1)
//                                }
//                            } label: {
//
//                            }
//                        }
//                    }
//                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                        CardView(dishName: "C", dishImage: "Chihaya_ofa_casual")
                        CardView(dishName: "Y", dishImage: "Yukiho_ofa_casual")
                        CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                        CardView(dishName: "C", dishImage: "Chihaya_ofa_casual")
                        CardView(dishName: "Y", dishImage: "Yukiho_ofa_casual")
                        CardView(dishName: "H", dishImage: "Haruka_ofa_casual")
                    }
                }
            }
            VStack {
                Button {
                    viewModel.darAmiibo()
                } label: {
                    Text(viewModel.amiiboEnvelope.amiibo?.amiiboSeries ?? "Welcome")
                }
            }
        }
    }
}

struct CardView: View {
    let dishName: String
    let dishImage: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 198, height: 360, alignment: .center)
            VStack {
                Image("\(dishImage)").resizable().frame(width: 198, height: 360, alignment: .top)
            }
        }
    }
}

struct StubView_Previews: PreviewProvider {
    static var previews: some View {
        StubViewDI().stubView
    }
}
