//
//  Neo.swift
//  Expiriments
//
//  Created by Максим Будник on 12.06.2020.
//  Copyright © 2020 Максим Будник. All rights reserved.
//

import SwiftUI

extension Color {
    static let offBlue = Color(red: 25 / 255, green: 31 / 255, blue: 36 / 255)
    static let subtitle = Color(red: 181 / 255, green: 194 / 255, blue: 207 / 255)
    static let title = Color(red: 209 / 255, green: 226 / 255, blue: 244 / 255)
    static let dollar = Color(red: 64 / 255, green: 141 / 255, blue: 236 / 255)
    static let orderButton2 = Color(red: 25 / 255, green: 30 / 255, blue: 38 / 255)
    static let orderButton1 = Color(red: 53 / 255, green: 63 / 255, blue: 85 / 255)
    static let preorderButton1 = Color(red: 48 / 255, green: 219 / 255, blue: 230 / 255)
    static let preorderButton2 = Color(red: 78 / 255, green: 74 / 255, blue: 242 / 255)
    static let preorderButton3 = Color(red: 67 / 255, green: 35 / 255, blue: 200 / 255)
    static let preorderButton4 = Color(red: 100 / 255, green: 64 / 255, blue: 250 / 255)
    static let cartButton1 = Color(red: 53 / 255, green: 63 / 255, blue: 89 / 255)
    static let cartButton2 = Color(red: 25 / 255, green: 30 / 255, blue: 38 / 255)
}

struct Neo: View {
    @State var show = false
    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 50) {
                    CoverView(show: $show)
                    OverviewSection()
                        .blur(radius: show ? 20 : 0)
                    
                    Spacer()
                }
                .clipped()
            }
        }
        .background(Color.offBlue)
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct Neo_Previews: PreviewProvider {
    static var previews: some View {
        Neo()
    }
}



struct NeoButton: View {
    var iconName: String = ""
    var body: some View {
        ZStack {
            Image(iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 21, height: 14)
            
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .stroke(Color.black.opacity(0.15), lineWidth: 1)
                .frame(width: 42, height: 42)
            
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .stroke(Color.black.opacity(0.15), lineWidth: 1)
                .frame(width: 30, height: 30)
        }
        .frame(width: 52, height: 52)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(red: 25 / 255, green: 30 / 255, blue: 38 / 255),  Color(red: 53 / 255, green: 63 / 255, blue: 89 / 255), ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color.white.opacity(0.09), radius: 3, x: 3, y: 3)
                
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color.clear, lineWidth: 10)
                    .shadow(color: Color.black.opacity(0.35), radius: 3, x: -8, y: -8)
                
            }
        )
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(color: Color.white.opacity(0.06), radius: 10, x: -8, y: -8)
            .shadow(color: Color.black.opacity(0.65), radius: 23, x: 20, y: 20)
        
    }
}

struct FeatureSection: View {
    var iconName: String = ""
    var title: String = ""
    var subtitle: String = ""
    var body: some View {
        HStack(spacing: 19) {
            NeoButton(iconName: iconName)
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .foregroundColor(Color.title)
                    .font(.system(size: 19, weight: .bold))
                Text(subtitle)
                    .foregroundColor(Color.subtitle)
                    .font(.system(size: 17, weight: .regular))
                
            }
        }
        .frame(alignment: .leading)
    }
}

struct OverviewSection: View {
    var body: some View {
        VStack(spacing: 45) {
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Dual Sense")
                    .foregroundColor(Color.title)
                    .font(.system(size: 31, weight: .semibold))
                    .frame(alignment: .leading)
                Text("DualSense also adds a built-in microphone array, which will enable players to easily chat with friends without a headset…")
                    .foregroundColor(Color.subtitle)
                    .font(.system(size: 19, weight: .regular))
            }
            
            
            VStack(spacing: 35) {
                HStack {
                    FeatureSection(iconName: "Controller", title: "Futuristic", subtitle: "Design")
                    Spacer()
                    FeatureSection(iconName: "Micro", title: "Bulilt-in", subtitle: "Microphone")
                }
                HStack {
                    FeatureSection(iconName: "Haptic", title: "Haptic", subtitle: "Feedback")
                    Spacer()
                    FeatureSection(iconName: "Micro", title: "Bulilt-in", subtitle: "Microphone")
                }
            }
            
            
            
            OrderButton()
            
        }
        .padding([.leading, .trailing], (UIApplication.shared.windows.first?.safeAreaInsets.left)! + 15)
        
    }
}

struct OrderButton: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    HStack {
                        Text("$")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.dollar)
                        Text("50")
                            .foregroundColor(Color.title)
                            .font(.system(size: 25, weight: .bold))
                        Spacer()
                        PreorderButton()
                        
                    }
                    .padding([.leading, .trailing])
                    Spacer()
                }
            }
        }
        .frame(height: 78)
        .background(
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.orderButton1,  Color.orderButton2]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
                //                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                //                            .stroke(Color.clear, lineWidth: 10)
                //                            .shadow(color: Color.white.opacity(0.09), radius: 3, x: 3, y: 3)
                //
                //                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                //                            .stroke(Color.clear, lineWidth: 10)
                //                            .shadow(color: Color.black.opacity(0.35), radius: 3, x: -5, y: -5)
                
            }
        )
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .shadow(color: Color.white.opacity(0.06), radius: 10, x: -8, y: -8)
            .shadow(color: Color.black.opacity(0.65), radius: 23, x: 20, y: 20)
    }
}


struct PreorderButton: View {
    var body: some View {
        ZStack {
            HStack {
                Text("Preorder")
                    .foregroundColor(.white)
                    .font(.system(size: 19, weight: .semibold))
                    .padding(.leading)
                Spacer()
                HStack(spacing: 0) {
                    Capsule()
                        .frame(width: 1)
                        .foregroundColor(Color.black.opacity(0.2))
                    Capsule()
                        .frame(width: 1)
                        .foregroundColor(Color.white.opacity(0.3))
                }
                Image(systemName: "arrow.right")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .light))
                    .padding(.trailing, 12)
            }
        }
        .frame(width: 164, height: 45)
        .background(
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.preorderButton1, Color.preorderButton2]), startPoint: .topLeading, endPoint: .bottomTrailing)
                
            }
        )
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .shadow(color: Color.white.opacity(0.20), radius: 1, x: -1, y: -1)
            .shadow(color: Color.black.opacity(0.45), radius: 18, x: 8, y: 10)
    }
}

struct Header: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.left")
                .foregroundColor(.white)
                .font(.system(size: 35, weight: .thin))
            Spacer()
            
            ZStack {
                Image("Cart")
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.preorderButton1, Color.preorderButton2]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 10, height: 10)
                    .offset(x: 10, y: -8)
            }
            .frame(width: 50, height: 50)
            .background(
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.cartButton1, Color.cartButton2]), startPoint: .topLeading, endPoint: .bottomTrailing)
                }
            )
                .clipShape(Circle())
                .shadow(color: Color(red: 31 / 255, green: 38 / 255, blue: 140 / 255).opacity(0.55), radius: 35, x: 0, y: 0)
            
            
        }
    }
}

struct CoverView: View {
    @Binding var show: Bool
    @State var viewState = CGSize.zero
    @GestureState var tap = false
    @State var press = false
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Header()
                    .padding([.leading, .trailing], (UIApplication.shared.windows.first?.safeAreaInsets.left)! + 15)
                    .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! )
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Platform".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                            Text("PS5".uppercased())
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Release".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                            Text("Fall 2020".uppercased())
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        VStack(alignment: .leading, spacing: 5) {
                            Text("PRICE".uppercased())
                                .foregroundColor(.white)
                                .font(.headline)
                            Text("PS5".uppercased())
                                .foregroundColor(.white)
                                .font(.subheadline)
                        }
                        
                        ZStack {
                            Image(systemName: "bookmark")
                                .foregroundColor(Color.white.opacity(0.4))
                                .opacity(self.press ? 0 : 1)
 
                            
                            Image(systemName: "bookmark.fill")
                                .foregroundColor(Color.orange)
                                .opacity(self.press ? 1 : 0)
           
                            
                            
                        }
                        .frame(width: 50, height: 50)
                        .background(
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [(self.press ? Color.cartButton1 : Color.cartButton2), (self.press ? Color.cartButton2 : Color.cartButton1 ) ]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                
                                Circle()                                                            .stroke(Color.clear, lineWidth: 10)
                                    .shadow(color: self.press ?  Color.white.opacity(0.09) : Color.black.opacity(0.35), radius: 3, x: 3, y: 3)
                                
                                Circle()                                                            .stroke(Color.clear, lineWidth: 10)
                                    .shadow(color: self.press ?  Color.black.opacity(0.35) : Color.white.opacity(0.09), radius: 3, x: -5, y: -5)
                            }
                        )
                            .clipShape(Circle())
                            .shadow(color: self.press ?  Color.white.opacity(0.06) : Color.black.opacity(0.25), radius: 5, x: -5, y: -5)
                            .shadow(color: self.press ?  Color.black.opacity(0.35) : Color.white.opacity(0.06), radius: 5, x: 5, y: 5)
                            .offset(y: self.tap ? 40 : 50)
                            .scaleEffect(self.tap ? 1.2 : 1)
                            .animation(.easeInOut)
                            .gesture(
                                LongPressGesture().updating(self.$tap) { currentState, gestureState, transaction in
                                    gestureState = currentState
                                }
                                .onEnded { value in
                                    self.press.toggle()
                                }
                        )
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
                .padding([.leading, .trailing], (UIApplication.shared.windows.first?.safeAreaInsets.left)! )
                
                Spacer()
            }
            .frame(height: proxy.size.height)
            .blur(radius: self.show ? 20 : 0)
            .background(
                ZStack {
                    Circle()
                        .fill(Color.white.opacity(0.11))
                        .offset(x: proxy.size.width / 3, y: -50)
                        .blur(radius: self.show ? 20 : 0)
                    Image("Curve1")
                        .offset(x: proxy.size.width / 3, y: -50)
                        .blur(radius: self.show ? 20 : 0)
                    Image("Curve2")
                        .offset(x: proxy.size.width / 2.5, y: -50)
                        .blur(radius: self.show ? 20 : 0)
                    Image("Curve3")
                        .offset(x: proxy.size.width / 2.5, y: -145)
                        .blur(radius: self.show ? 20 : 0)
                    Image("hero")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 280, height: 385.56)
                        .offset(x: self.viewState.width, y: self.viewState.height)
                        .offset(x: 50, y: 110)
                        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                        .gesture(
                            DragGesture().onChanged { value in
                                self.viewState = value.translation
                                self.show = true
                            }
                            .onEnded { value in
                                self.viewState = .zero
                                self.show = false
                            }
                    )
                    
                }
            )
                .background(LinearGradient(gradient: Gradient(colors: [Color.preorderButton1, Color.preorderButton2]), startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .frame(height: 350)
    }
}
