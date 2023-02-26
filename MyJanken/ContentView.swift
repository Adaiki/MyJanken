//
//  ContentView.swift
//  MyJanken
//
//  Created by 赤荻大輝 on 2023/01/20.
//

import SwiftUI

struct ContentView: View {
    
    //じゃんけんの結果を格納する変数（0=初期画面　1=グー　2=チョキ　3=パー）
    @State var answerNumber = 0
    
    var body: some View {
        
        VStack {
            //スペースを追加
            Spacer()
            
            //じゃんけんの数字が0だったら
            if answerNumber == 0{
                //初期画面のテキストを表示
                Text("これからじゃんけんをします！")
                //下辺に余白を設定
                    .padding(.bottom)
            }else if answerNumber == 1{
                //じゃんけんの数字が1だったら、グー画像を表示
                //グー画像を指定
                Image("gu")
                //リサイズを指定
                    .resizable()
                //アスペクト比を維持する指定
                    .scaledToFit()
                
                //スペースを追加
                Spacer()
                
                //じゃんけんの種類を指定
                Text("グー")
                //下辺に余白を設定
                    .padding(.bottom)
                
            }else if answerNumber == 2{
                //じゃんけんの数字が2だったら、チョキ画像を表示
                //チョキ画像を指定
                Image("choki")
                //リサイズを指定
                    .resizable()
                //アスペクト比を維持する指定
                    .scaledToFit()
                
                //スペースを追加
                Spacer()
                
                //じゃんけんの種類を指定
                Text("チョキ")
                //下辺に余白を設定
                    .padding(.bottom)
                
            }else{
                //じゃんけんの数字が1,2以外だったら、パー画像を表示
                //パー画像を指定
                Image("pa")
                //リサイズを指定
                    .resizable()
                //アスペクト比を維持する指定
                    .scaledToFit()
                
                //スペースを追加
                Spacer()
                
                //じゃんけんの種類を指定
                Text("パー")
                //下辺に余白を設定
                    .padding(.bottom)
            }//ifはここまで
            
            
            
            //「じゃんけんをする！」ボタン
            Button {
                //新しいじゃんけんの結果を一時的に格納する変数を設ける
                var newAnswerNumber = 0
                
                //ランダムに結果を出すが、前回の結果と異なる場合のみ採用
                //repeatは繰り返しを意味する
                repeat{
                    //1,2,3の数値をランダムに算出（乱数）
                    newAnswerNumber = Int.random(in: 1...3)
                    
                    //前回と同じ結果の時は、再度ランダムに数値を算出
                    //異なる結果の時に、repeatを抜ける
                }while answerNumber == newAnswerNumber
                
                //新しいじゃんけんの結果を格納
                answerNumber = newAnswerNumber
            } label: {
                //ボタンに表示する文字を指定
                Text("じゃんけんをする！")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .font( .title)
                    .background(Color.pink)
                    .foregroundColor(Color.white)
            }//じゃんけんをするボタンをここまで
        }//VStackはここまで
    }//bodyはここまで
}//ContentViewはここまで

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
