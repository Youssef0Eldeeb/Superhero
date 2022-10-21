//
//  PlaySound.swift
//  Superhero
//
//  Created by Youssef Eldeeb on 21/10/2022.
//

import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String){
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print(error.localizedDescription)
        }
    }
}

