//
//  SettingUIViewController.swift
//  cookbook
//
//  Created by 鍾瑀璇 on 2022/5/20.
//

import UIKit

class SettingUIViewController: UIViewController {

    //拉IBOutlet//
    //溫度
    @IBOutlet weak var celsiusTextField: UITextField!
    @IBOutlet weak var fahrenheitTextField: UITextField!
    
    //容量
    @IBOutlet weak var tspTextField: UITextField!
    @IBOutlet weak var cupTextField: UITextField!
    @IBOutlet weak var tbspTextField: UITextField!
    @IBOutlet weak var mlTextField: UITextField!
    
    //重量
    @IBOutlet weak var ozTextField: UITextField!
    @IBOutlet weak var lbTextField: UITextField!
    @IBOutlet weak var gTextField: UITextField!
    @IBOutlet weak var kgTextField: UITextField!
    
    //烤模
    
    @IBOutlet weak var originalPanTextField: UITextField!
    @IBOutlet weak var newPanTextField: UITextField!
    @IBOutlet weak var ingredientRatioLabel: UILabel!
    @IBOutlet weak var originalPanLabel: UILabel!
    @IBOutlet weak var newPanLabel: UILabel!
    @IBOutlet weak var selectPan: UISegmentedControl!
    
    
    //viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        originalPanLabel.text = "原本圓模"
        newPanLabel.text = "轉為方模"

        // Do any additional setup after loading the view.
    }
    
    //容量換算function
    func calculateVolume(keyIn:UITextField,convertTsp:Float,convertMl:Float,convertTbsp:Float,convertCup:Float){
        if Float(keyIn.text!) != nil{
            let tsp = String(format: "%.2f", (Float(keyIn.text!)! * convertTsp))
            tspTextField.text = "\(tsp)"
            let ml = String(format: "%.2f", (Float(keyIn.text!)! * convertMl))
            mlTextField.text = "\(ml)"
            let tbsp = String(format: "%.2f", (Float(keyIn.text!)! * convertTbsp))
            tbspTextField.text = "\(tbsp)"
            let cup = String(format: "%.2f", (Float(keyIn.text!)! * convertCup))
            cupTextField.text = "\(cup)"
            
        }
    }
    //重量換算function
    func calculateWeight(keyIn:UITextField,convertOz:Float,convertLb:Float,convertG:Float,convertKg:Float){
        if Float(keyIn.text!) != nil{
            let oz = String(format: "%.2f", (Float(keyIn.text!)! * convertOz))
            ozTextField.text = "\(oz)"
            let lb = String(format: "%.2f", (Float(keyIn.text!)! * convertLb))
            lbTextField.text = "\(lb)"
            let g = String(format: "%.1f", (Float(keyIn.text!)! * convertG))
            gTextField.text = "\(g)"
            let kg = String(format: "%.2f", (Float(keyIn.text!)! * convertKg))
            kgTextField.text = "\(kg)"
        }
    }
    //烤模換算function
    func calculateRatio(keyInOrigin:UITextField,keyInNew:UITextField,originSquareInch:Float,newSquareInch:Float,piForOrigin:Float,piForNew:Float){
        let original = Float(keyInOrigin.text!)
        let new = Float(keyInNew.text!)
        if original != nil && new != nil{
            // 假設維持相同蛋糕高度條件下 食材比例為 新模具面積/原模具面積
            // 圓模面積為 半徑*半徑*pi 半徑為(英吋/2)
            // 方模面積為 長*寬
            let ratio = ((new! * newSquareInch) * (new! * newSquareInch) * piForNew) / ((original! * originSquareInch ) * (original! * originSquareInch) * piForOrigin)
            ingredientRatioLabel.text = String(format: "%.2f", ratio)
        }else{
            ingredientRatioLabel.text = " "
        }
    }
 
    
    //溫度換算//
    //輸入攝氏 自動顯示華氏
    @IBAction func cToF(_ sender: Any) {
        fahrenheitTextField.text = " "
        if Float(celsiusTextField.text!) != nil{
            let fahrenheit = String(format: "%.1f", Float(celsiusTextField.text!)! * 1.8 + 32)
                fahrenheitTextField.text = "\(fahrenheit)"
        }else{
            fahrenheitTextField.text = " "
        }}
    //輸入華氏 自動顯示攝氏

    @IBAction func fToC(_ sender: Any) {
        if Float(fahrenheitTextField.text!) != nil{
            let celcius = String(format: "%.1f", (Float(fahrenheitTextField.text!)! - 32) / 1.8)
            celsiusTextField.text = "\(celcius)"
        }else{
            celsiusTextField.text = " "
        }
    }

    //容量換算//
    //輸入茶匙
    

    @IBAction func keyInTsp(_ sender: UITextField) {
        //cupTextField.text = " "
        //tbspTextField.text = " "
        //mlTextField.text = " "
        calculateVolume(keyIn: sender, convertTsp: 1, convertMl: 5, convertTbsp: 1/3, convertCup: 1/48)
    }
    //輸入杯
    @IBAction func keyInCup(_ sender: UITextField) {
        tspTextField.text = " "
        tbspTextField.text = " "
        mlTextField.text = " "
        calculateVolume(keyIn: sender, convertTsp: 48, convertMl: 240, convertTbsp: 16, convertCup: 1)
        
    }
    //輸入湯匙
    @IBAction func keyInTbsp(_ sender: UITextField) {
        tspTextField.text = " "
        cupTextField.text = " "
        mlTextField.text = " "
        calculateVolume(keyIn: sender, convertTsp: 3, convertMl: 15, convertTbsp: 1, convertCup: 1/16)
    }
    //輸入毫升
    @IBAction func keyInMl(_ sender: UITextField) {
        tspTextField.text = " "
        cupTextField.text = " "
        tbspTextField.text = " "
        calculateVolume(keyIn: sender, convertTsp: 1/5, convertMl: 1, convertTbsp: 1/15, convertCup: 1/240)
    }
    
    //重量換算//
    //輸入盎司
    
    @IBAction func keyInOz(_ sender: UITextField) {
        lbTextField.text = " "
        gTextField.text = " "
        kgTextField.text = " "
        calculateWeight(keyIn: sender, convertOz: 1, convertLb: 0.0625, convertG: 28.3495, convertKg: 0.0283)
    }
    //輸入磅
    @IBAction func keyInLb(_ sender: UITextField) {
        ozTextField.text = " "
        gTextField.text = " "
        kgTextField.text = " "
        calculateWeight(keyIn: sender, convertOz: 16, convertLb: 1, convertG: 453.5923, convertKg: 0.4534)
    }
    //輸入公克
    @IBAction func keyInG(_ sender: UITextField) {
        ozTextField.text = " "
        lbTextField.text = " "
        kgTextField.text = " "
        calculateWeight(keyIn: sender, convertOz: 0.0352, convertLb: 0.0022, convertG: 1, convertKg: 0.001)
    }
    //輸入公斤
    @IBAction func keyInKg(_ sender: UITextField) {
        ozTextField.text = " "
        lbTextField.text = " "
        gTextField.text = " "
        calculateWeight(keyIn: sender, convertOz: 35.2739, convertLb: 2.2046, convertG: 1000, convertKg: 1)
    }
    
    //烤模換算//
    //選轉換方式
    @IBAction func selectPan(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            originalPanTextField.text = " "
            newPanTextField.text = " "
            ingredientRatioLabel.text = " "
            originalPanLabel.text = "原本圓模"
            newPanLabel.text = "轉為方模"
        }else if sender.selectedSegmentIndex == 1{
            originalPanTextField.text = " "
            newPanTextField.text = " "
            ingredientRatioLabel.text = " "
            originalPanLabel.text = "原本圓模"
            newPanLabel .text = "轉為圓模"
        }else if sender.selectedSegmentIndex == 2{
            originalPanTextField.text = " "
            newPanTextField.text = " "
            ingredientRatioLabel.text = " "
            originalPanLabel.text = "原本方模"
            newPanLabel.text = "轉為圓模"
        }else{
            originalPanTextField.text = " "
            newPanTextField.text = " "
            ingredientRatioLabel.text = " "
            originalPanLabel.text = "原本方模"
            newPanLabel.text = "轉為方模"
        }
    }
    //計算比例
    @IBAction func calculateRatio(_ sender: UITextField) {
        if selectPan.selectedSegmentIndex == 0{
            //圓轉方
            calculateRatio(keyInOrigin: originalPanTextField, keyInNew: newPanTextField, originSquareInch: 0.5, newSquareInch: 1, piForOrigin: Float.pi, piForNew: 1)
        }else if selectPan.selectedSegmentIndex == 1{
            //圓轉圓
            calculateRatio(keyInOrigin: originalPanTextField, keyInNew: newPanTextField, originSquareInch: 0.5, newSquareInch: 0.5, piForOrigin: Float.pi, piForNew: Float.pi)
        }else if selectPan.selectedSegmentIndex == 2{
            //方轉圓
            calculateRatio(keyInOrigin: originalPanTextField, keyInNew: newPanTextField, originSquareInch: 1, newSquareInch: 0.5, piForOrigin: 1, piForNew: Float.pi)
        }else{
            //方轉方
            calculateRatio(keyInOrigin: originalPanTextField, keyInNew: newPanTextField, originSquareInch: 1, newSquareInch: 1, piForOrigin: 1, piForNew: 1)
        }
    }
    
    
    //收鍵盤
    @IBAction func endEditing(_ sender: Any) {
        view.endEditing(true)
    }
    



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
