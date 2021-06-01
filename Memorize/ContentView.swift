//
//  ContentView.swift
//  Memorize
//
//  Created by Chang Liu on 5/27/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel :EmojiMemoryGame
    var emojis = travelAndPlaces
    @State var emojiCount = 4
    
    var body: some View {
        VStack{
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]
                ){
                    ForEach(viewModel.cards) {card in
                        CardView(card: card)
                            .aspectRatio(2/3,contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }.foregroundColor(.red)
            }
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }.font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)

    }
    
    var remove: some View{
        Button {
                if emojiCount>1 {emojiCount-=1}
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add :some View{
        Button{
            if emojiCount<emojis.count{
                emojiCount+=1}
        }label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView:View {
    let card: MemoryGame<String>.Card
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            }else if card.isMatched{
                shape.opacity(0)
            }
            else{
                shape.fill()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game).preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView(viewModel: game).preferredColorScheme(.light)
    }
}
