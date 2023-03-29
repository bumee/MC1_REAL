import SwiftUI
import Foundation

struct AnimatableSystemFontModifier: ViewModifier, Animatable {
    var size: Double
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: Double {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}

struct FourthScreenView: View {
    
    @State private var fontSize = 32.0
    
    var body: some View{
        
        if #available(iOS 16.0, *) {
            
            
            NavigationStack {
                VStack {
                    HStack{
                        
                        Image("group1")
                            .resizable()
                            .frame(width: 280, height: 210)
                        
                        Image("group2")
                            .resizable()
                            .frame(width: 280, height: 150)
                        
                    }
                    
                    VStack{
                        
                        Text("""
                            첫 발표에서는 각자가 가장 잘 하는 것을 맡았다면
                            이번에는 가장 못하는 부분을 서로에게서 배워보자.
                            """)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        
                        Spacer().frame(height: 50.0)
                        
                        Text("""
                            그렇게 우리의 두 번째 챌린지 주제는
                            무수리들의 공주되기 프로젝트로 정해졌다.
                            """)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .animatableSystemFont(size: fontSize)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                                fontSize = 72
                            }
                        }
                        
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: StatsScreenView()){
                        Text("넘어가기 버튼")
                            .foregroundColor(Color.black)
                            .frame(width: 100, height: 60, alignment: .center)
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray))
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}


extension View {
    func animatableSystemFont(size: Double, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
        self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
    }
}


