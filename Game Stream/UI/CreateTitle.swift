//
//  CreateTitle.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import SwiftUI

struct CreateTitle:View{
    var title:String
    var isPreview:Bool?
    var body: some View{
        ZStack{
            
            if isPreview ?? false {
                Color.black
            }
            
            HStack{
                Text(" " + title).font(.system(size: 20,weight: .semibold)).multilineTextAlignment(.leading).foregroundStyle(.white)
                Spacer()
            }.padding([.top, .leading, .trailing], 2.0)
            
        }
        
       
    }
}


#Preview {
    CreateTitle(title:"Great title",isPreview: true)
}
