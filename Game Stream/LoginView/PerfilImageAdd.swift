//
//  PerfilImageAdd.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/11/24.
//

import SwiftUI

struct PerfilImageAdd:View{
    var body: some View{
        VStack{
            Text("Choose a profile pic").font(.title3).fontWeight(.semibold).foregroundColor(.white)
            Text("you can change or choose it later").font(.caption).foregroundColor(.gray).padding(.bottom)
            ZStack{
                Image("userPerfil").resizable().frame(width: 140,height: 100).opacity(0.6)
                Button {
                    print("add photo")
                } label: {
                    Image(systemName: "camera.shutter.button").resizable(resizingMode: .tile).foregroundColor(.white).frame(width: 30.0, height: 30.0)
                }

            }
        }
    }
}

#Preview {
    PerfilImageAdd()
}
