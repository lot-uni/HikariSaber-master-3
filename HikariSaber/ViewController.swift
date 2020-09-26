import UIKit
import CoreMotion
import AVFoundation
import AudioToolbox

class ViewController: UIViewController {

//プログラムのセットアップ
    var dataArray: [Data] = []
    let motionManager = CMMotionManager()
//    var audioPlayer = AVAudioPlayer()
    var audioPlayerInstance : AVAudioPlayer! = nil
    var startAudioPlayer = AVAudioPlayer()
    var index: Int = 0
    @IBOutlet var sund: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    
    var soundName : String!
    
//音のインスタンスを作成
//    let SinePlayer = try! AVAudioPlayer(data: NSDataAsset(name: "mens-ou1")!.data)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundFilePath = Bundle.main.path(forResource: soundName, ofType: "mp3")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        
        do {
                  audioPlayerInstance = try AVAudioPlayer(contentsOf: sound, fileTypeHint:nil)
        } catch {
            print("AVAudioPlayerインスタンス作成でエラー")
        }
        audioPlayerInstance.prepareToPlay()
        dataArray.append(Data(name: "ドのハンドベル", imageName: "ド.png"))
        dataArray.append(Data(name: "レのハンドベル", imageName: "レ.png"))
        dataArray.append(Data(name: "ミのハンドベル", imageName: "ミ.png"))
        dataArray.append(Data(name: "ファのハンドベル", imageName: "ファ.png"))
        dataArray.append(Data(name: "ソのハンドベル", imageName: "ソ.png"))
        dataArray.append(Data(name: "ラのハンドベル", imageName: "ラ.png"))
        dataArray.append(Data(name: "シのハンドベル", imageName: "シ.png"))
        setUI()
        
//getAccelerometerを取得
        getAccelerometer()
    }
    
    func setUI() {
        imageView.image = dataArray[index].getImage()
        nameLabel.text = dataArray[index].name
        
    }
    
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//
//    }
    
    @IBAction func mae() {
        if(index != 0){
            index = index - 1
            setUI()
        }
    }
    @IBAction func tugi() {
        if(index != 6){
            index = index + 1
            setUI()
        }
    }
    func getAccelerometer() {
        var preBool = false
        var postBool = false
        motionManager.accelerometerUpdateInterval = 1 / 5
        motionManager.startAccelerometerUpdates(to: OperationQueue.current! , withHandler: { [self] (accelerometerData, error) in
            
            guard error == nil else {
                return
            }
            
            let x = accelerometerData!.acceleration.x
            let y = accelerometerData!.acceleration.y
            let z = accelerometerData!.acceleration.z
            let synthetic = (x * x) + (y * y) + (z * z)

            if preBool {
                postBool = true
            }
            
            if !postBool && synthetic >= 3 {
                self.audioPlayerInstance.currentTime = 0         // 再生箇所を頭に移す
                        
                self.audioPlayerInstance.play()                  // 再生する

                
                preBool = true
                
            }
            
            if postBool && synthetic >= 3 {
                self.audioPlayerInstance.currentTime = 0         // 再生箇所を頭に移す
                self.audioPlayerInstance.play()                  // 再生する

                
                postBool = false
                preBool = false
            }
        })
    }
    
    
    func setSound() {
        if(index == 1){
            
            soundName = "mens-ou1"
        }else if(index == 2){
            soundName = "drum-japanese1"
            
        }else if(index == 3){
            soundName = "drum-japanese1"
        }else if(index == 4){
            soundName = "drum-japanese1"
        }else if(index == 5){
            soundName = "drum-japanese1"
        }else if(index == 6){
            soundName = "drum-japanese1"
        }else if(index == 7){
            soundName = "drum-japanese1"
        }
        super.didReceiveMemoryWarning()
    }
    
    
}

