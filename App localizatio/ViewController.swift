import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
 
    @IBOutlet weak var lb1: UILabel!
    @IBOutlet weak var txt1: UITextField!
    @IBOutlet weak var lan: UIPickerView!
    var language = ["English","Hindi","Gujrati"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return language.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return language[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if language[row] == "English"{
            changeLanguage(lang: "en")
        }
        else if language[row] == "Hindi" {
            changeLanguage(lang: "hi")
        }
        else {
            changeLanguage(lang: "gu-IN")
        }
    }
    func changeLanguage(lang : String){
        lb1.text = "title".localizeString(string: lang)
        txt1.placeholder = "info".localizeString(string: lang)
    }
}

extension String {
    func localizeString(string:String) -> String {
        let path = Bundle.main.path(forResource: string, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self,tableName: nil,bundle: bundle!,value: "", comment: "")
    }
}

