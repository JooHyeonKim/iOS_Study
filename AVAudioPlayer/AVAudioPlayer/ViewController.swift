//
//  ViewController.swift
//  AVAudioPlayer
//
//  Created by 김주현 on 2023/11/01.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  var player = AVAudioPlayer()
  
  @IBOutlet weak var playButton: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func volumeOff(_ sender: UIButton) {
    player.volume = 0.0
  }
  
  @IBAction func volumeUp(_ sender: UIButton) {
    player.volume = 1.0
  }
  
  @IBAction func playButtonTap(_ sender: UIButton) {
    let audioURLString = "https://bxhupkxcpbwycyjbulso.supabase.co/storage/v1/object/public/guide_audios/A-THOME%20Glazed/A_Act3_04.mp3"
        
        if let audioData = getDataFrom(url: audioURLString) {
            playAudio(audioData: audioData)
        } else {
            print("Failed to retrieve audio data from URL.")
        }
  }
  
  ///오디오 재생
  func playAudio(audioData: Data) {
    do {
      player = try AVAudioPlayer(data: audioData)
      player.play()
    } catch {
      print("\(error.localizedDescription)")
    }
  }
  
  //URL로부터 Data를 얻음.
  func getDataFrom(url: String) -> Data? {
    var data: Data?
    if let url = URL(string: url) {
      do {
        data = try Data(contentsOf: url)
      } catch {
        print("\(error.localizedDescription)")
      }
    }
    return data
  }
  
}

