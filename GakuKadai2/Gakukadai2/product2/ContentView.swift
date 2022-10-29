//
//  ContentView.swift
//  product2
//
//  Created by 中川岳 on 2022/10/23.
//

import SwiftUI


struct ContentView: View {
    
    @State var number1=""
    @State var number2=""
    @State var selectedIndex=0
    @State var resultText=""
    
    func changeNum(_ text:String) -> Int{
        Int(text) ?? 0
    }

    var body: some View {
    
        VStack {
            CustomTextField(number: $number1)
            CustomTextField(number: $number2)
            Picker("", selection: self.$selectedIndex) {
                Text("+")
                    .tag(0)
                Text("-")
                    .tag(1)
                Text("×")
                    .tag(2)
                Text("÷")
                    .tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 250)
            .colorMultiply(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            
            Button(action: {
                switch selectedIndex{
                case 0:resultText="\(changeNum(number1)+changeNum(number2))"
                case 1:resultText="\(changeNum(number1)-changeNum(number2))"
                case 2:resultText="\(changeNum(number1)*changeNum(number2))"
                case 3:if changeNum(number2)==0{
                    resultText="割る数には0以外を代入してください"
                }else{
                    resultText="\(Double(changeNum(number1))/Double(changeNum(number2)))"
                }
                default:
                    resultText="数字を入力してください"
                }
                
            }, label: {
                Text("Button")
            })
            
            Text(resultText)
            
            Spacer()
        }
        .padding(15)
    }
    
}

struct CustomTextField:View{
    @Binding var number:String
    
    var body: some View{
        TextField("", text: $number)
            .frame(width:100,height: 25)
            .border(Color.black,width: 1)
            .keyboardType(.numberPad)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
