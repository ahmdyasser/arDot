
//  ContentView.swift
//  Arabic
//
//  Created by Ahmad Yasser on 17/05/2021.
//

import SwiftUI
import Combine
import MobileCoreServices



struct ContentView: View {
    
    @State private var inputText = "اكتب هنا"
    @State private var outputText = "النتيجة هنا"
    @State private var convertedText =   ""
    @State private var isPressed = false
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.9685876966, green: 0.9686368108, blue: 0.9728204608, alpha: 1)))
                .ignoresSafeArea()
            VStack {


                Spacer()
                Image("enterText")
                    .padding()

                TextEditor(text: $inputText)
                    .multilineTextAlignment(.trailing)
                    .cornerRadius(10)

                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .cornerRadius(10)
                    
                    VStack {
                        HStack {
                            Spacer()
                            Text("\(Converter().convert(word: inputText))")
                        }
                        .padding(.top, 5)
                        Spacer()
                    }.padding(.trailing, 5)
                        
                }
                Spacer()

                Button(action: {
                    isPressed.toggle()
                    UIPasteboard.general.setValue(outputText, forPasteboardType: kUTTypePlainText as String)
                }, label: {
                    Image("convertButton")
                })
                .offset( y: isPressed ? 5 : 0)
                .animation(.easeInOut)
               
                    
                Spacer()

            }.padding()
        }



    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {

        ContentView()
    }
}


struct Converter {
    let collection = [["\u{0625}","\u{0627}"],["\u{0627}","\u{0627}"], ["\u{0623}","\u{0627}"], ["\u{0628}","\u{066E}"], ["\u{062A}","\u{066E}"], ["\u{062B}","\u{066E}"], ["\u{062C}","\u{062D}"], ["\u{062D}","\u{062D}"], ["\u{062E}","\u{062D}"], ["\u{062F}","\u{062F}"], ["\u{0630}","\u{062F}"], ["\u{0631}","\u{0631}"], ["\u{0632}","\u{0631}"], ["\u{0633}","\u{0633}"], ["\u{0634}","\u{0633}"], ["\u{0635}","\u{0635}"], ["\u{0636}","\u{0635}"], ["\u{0637}","\u{0637}"], ["\u{0638}","\u{0637}"], ["\u{0639}","\u{0639}"], ["\u{063A}","\u{0639}"], ["\u{0641}","\u{06A1}"], ["\u{0642}","\u{066F}"], ["\u{0643}","\u{0643}"], ["\u{0644}","\u{0644}"],  ["\u{0645}","\u{0645}"], ["\u{0646}","\u{06BA}"], ["\u{0647}","\u{0647}"], ["\u{0648}","\u{0648}"], ["\u{064A}","\u{066E}"], ["\u{FEF3}","\u{066E}"], ["\u{FEF2}","\u{FEF0}"], ["\u{FEF4}","\u{066E}"], ["\u{0626}","\u{066E}"]]

    func convert(word: String) -> String {
        var newWord = ""
        
        for j in word {
            if j == " " {
                newWord.append(" ")
            }
            for i in collection {
                if Character(i[0]) == j {
                    newWord.append(i[1])
                }
            }
        }
        print(newWord)
        return newWord
    }
}
