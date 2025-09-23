import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // 알람 시간 저장 변수
    var alarmTime: String = ""
    
    // 타이머 관련 상수
    let timeSelector: Selector = #selector(updateTime)
    let interval = 1.0   // 1초마다 실행
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 타이머 설정: 1초마다 updateTime 호출
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    // 현재 시간 업데이트
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        // 현재 시간 표시
        lblCurrentTime.text = "현재 시간: " + formatter.string(from: date as Date)
        
        // 알람 시간과 비교
        if formatter.string(from: date as Date) == alarmTime {
            self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    // 데이트 피커 변경 시 호출
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblPickerTime.text = "선택 시간: " + formatter.string(from: sender.date)
        
        // 알람 시간 저장
        alarmTime = formatter.string(from: sender.date)
    }
}
