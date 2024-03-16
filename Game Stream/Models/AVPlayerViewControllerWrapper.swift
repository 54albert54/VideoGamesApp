//
//  AVPlayerViewControllerWrapper.swift
//  Game Stream
//
//  Created by Angel alberto Bernechea on 3/15/24.
//

import Foundation
import AVKit
import SwiftUI


struct AVPlayerViewControllerWrapper: UIViewControllerRepresentable {
    let videoURL: URL

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let player = AVPlayer(url: videoURL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        player.play()

        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {}
}
