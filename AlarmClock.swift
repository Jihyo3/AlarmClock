import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var alarmTime: String = ""
    
    let timeSelector: Selector = #selector(updateTime)
    let interval = 1.0 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblCurrentTime.text = "현재 시간: " + formatter.string(from: date as Date)
        
        if formatter.string(from: date as Date) == alarmTime {
            self.view.backgroundColor = UIColor.red
        } else {
            self.view.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        
        lblPickerTime.text = "선택 시간: " + formatter.string(from: sender.date)
        
        alarmTime = formatter.string(from: sender.date)
    }
}
