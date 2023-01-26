//
//  OnboardingView.swift
//  Restart
//
//  Created by Sabbir Hossain on 16/11/22.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - Property
    @AppStorage("onboarding") var isOnboardingViewActive = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating = false
    var body: some View {
        ZStack {
            Color("ColorBlue").ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - HEADER
                
                Spacer()
                
                VStack{
                    Text("SHARE.")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    Text("""
It's not how much we give but
how much love we put into give in
""")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center).padding(.horizontal, 10)
                }//: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y : isAnimating ? 0: -400)
                .animation(.easeOut(duration: 1.0), value: isAnimating)
                
                Spacer()
                
                // MARK: - CENTER
                
                ZStack {
                    ZStack {
                        
                        Circle().stroke(.white.opacity(0.2), lineWidth:  40).frame(width: 260, height: 260, alignment: .center)
                        Circle().stroke(.white.opacity(0.2), lineWidth:  80).frame(width: 260, height: 260, alignment: .center)
                        Image("character-1").resizable().scaledToFit()
                        
                    }//: ZSTACK
                }//: CENTER
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // Parts of the custom button
                    // 1. Background (static)
                    Capsule().fill(Color.white.opacity(0.2))
                    Capsule().fill(Color.white.opacity(0.2)).padding(8)
                    // 2. Call to action (static)
                    Text("Get started").font(.system(.title3, design: .rounded)).fontWeight(.bold).foregroundColor(.white).offset(x: 20, y: 0)
                    // 3. Capsule (Dynamic width)
                    HStack {
                        Capsule().fill(Color("ColorRed")).frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    // 4. Circle (Draggable)
                    HStack {
                        ZStack {
                            Circle().fill(Color("ColorRed"))
                            Circle().fill(Color.black).opacity(0.15).padding(8)
                            Image(systemName: "chevron.right.2").font(.system(size: 24).bold())
                        }.foregroundColor(.white)
                            .frame(width: 80, alignment: .center)
                            .offset(x: buttonOffset)
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        debugPrint("gesture translation \(gesture.translation.width)")
                                        if ((gesture.translation.width > 0) && buttonOffset <= buttonWidth-80){
                                            buttonOffset = gesture.translation.width
                                        }
                                    })
                                    .onEnded({ _ in
                                        if buttonOffset < (buttonWidth/2) {
                                            buttonOffset = 0
                                        } else {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingViewActive = false
                                        }
                                    })
                            )//: Gesture
                        Spacer()
                    }//: HStack
                }//: Footer
                .frame(width: buttonWidth,height: 80, alignment: .center)
                .padding()
                
            }//: VStack
        }//: ZStack
        .onAppear {
            isAnimating = true
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
