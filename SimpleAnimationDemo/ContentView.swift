//
//  ContentView.swift
//  SimpAnimationDemo
//
//
//  A Demo for iOS Development Tips Weekly
//  Season 9 (Q1 2020) video 12. 
//  by Steven Lipton (C)2020, All rights reserved
// Check out the video series on LinkedIn learning at https://linkedin-learning.pxf.io/YxZgj
//  For code go to http://bit.ly/AppPieGithub


import SwiftUI

struct ContentView: View {
    @State var fade:Bool = false
    @State var slide = 0
    @State var corners = 0

    func resetImage(){
        withAnimation(nil){
            fade = false
            slide = 0
            corners = 0
            
        }
    }
    
    var body: some View {
        VStack{
            Text("Animation Demo")
                .font(.largeTitle)
                .fontWeight(.heavy)
                Text("Plumeria flowers")
                .opacity(fade ? 0.0:1.0)
                .offset(x: CGFloat(slide), y: 0.0)
            
            
            Image("Flower")
            .resizable()
            .scaledToFit()
                .opacity(fade ? 0.0:1.0)
                
                .offset(x: CGFloat(slide), y: 0.0)
                
                .cornerRadius(CGFloat(corners))
                //.animation(.easeInOut(duration:2.0))
               
                
                .padding(.bottom, 20)
            
            ///Code for the three gestures
            HStack{
                
                Button("Fade"){
                    withAnimation{
                        self.fade.toggle()
                        
                    }
                }
                Spacer()
                Button("Corners") {
                    withAnimation(Animation.easeOut(duration:1.3).delay(1.0)){
                        self.corners = (self.corners + 30) % 100
                        
                    }
                }
                Spacer()
                Button("Slide") {
                    withAnimation(Animation.interpolatingSpring(stiffness: 10, damping: 1.0)){
                        self.slide = (self.slide + 50) % 200
                        
                    }
                }
            }
            .font(.title)
            .padding()
            .background(Color.green)
            .foregroundColor(.black)
           
            Text("Reset")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.green)
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                .padding()
                .onTapGesture {self.resetImage()}
            Spacer()
        }
        .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color.white,Color.gray, Color.white]), startPoint: .top, endPoint: .bottom))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
