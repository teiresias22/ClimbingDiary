//
//  AddEventViewControleer.swift
//  ClimbingDiary
//
//  Created by Joonhwan Jeon on 2022/06/17.
//

import Foundation

class AddEventViewControleer: BaseViewController {
    let mainView = AddEventView()
    var viewModel = ScheduleModel()
    
    let dateFormatter = DateFormatter()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "추가"
        
        //초기세팅
        setDateLabel()
        setTitleLabel()
        setDateFormatter()
    }
    
    private func setDateFormatter() {
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    //MARK: - Setup DateLaberl && DatePickerView
    private func setDateLabel() {
        mainView.inputDateView.titleLabel.text = "날짜"
        mainView.inputDateView.outputLabel.text = viewModel.selectDate.value
        
        let viewTap = CustomTapGestureRecognizer(target: self, action: #selector(dateViewClicked))
        mainView.inputDateView.isUserInteractionEnabled = true
        mainView.inputDateView.addGestureRecognizer(viewTap)
    }
    
    @objc func dateViewClicked() {
        createDatePickerView()
        mainView.pickerViewTextfield.becomeFirstResponder()
    }
    
    private func createDatePickerView() {
        let pickerView = UIDatePicker()
        pickerView.locale = Locale(identifier: "ko-KR")
        pickerView.preferredDatePickerStyle = .wheels
        pickerView.datePickerMode = .date
        pickerView.timeZone = NSTimeZone.local
        pickerView.maximumDate = Date()
        
        mainView.pickerViewTextfield.inputView = pickerView
        pickerView.addTarget(self, action: #selector(dateValueChanged(_:)), for: .valueChanged)
        setPickerViewToolBar()
    }
    
    @objc func dateValueChanged(_ sender: UIDatePicker) {
        viewModel.selectDate.value = dateFormatter.string(from: sender.date)
        mainView.inputDateView.outputLabel.text = viewModel.selectDate.value
    }
    
    //MARK: - Setup TitleLabel && TitlePickerView
    private func setTitleLabel() {
        mainView.inputTitleView.titleLabel.text = "암장"
        if viewModel.selectCrag.value.isEmpty {
            mainView.inputTitleView.outputLabel.text = "암장을 선택해주세요."
        } else {
            mainView.inputTitleView.outputLabel.text = viewModel.selectCrag.value
        }
        
        let viewTap = CustomTapGestureRecognizer(target: self, action: #selector(totleViewClicked))
        mainView.inputTitleView.isUserInteractionEnabled = true
        mainView.inputTitleView.addGestureRecognizer(viewTap)
    }
    
    @objc func totleViewClicked() {
        createCragPickerView()
        mainView.pickerViewTextfield.becomeFirstResponder()
    }
    
    private func createCragPickerView() {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
                
        mainView.pickerViewTextfield.inputView = pickerView
        setPickerViewToolBar()
    }
    
    //MARK: - Setup PickerViewToolBar
    private func setPickerViewToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let btnDone = UIBarButtonItem(title: "확인", style: .done, target: self, action: #selector(onPickDone(_:)))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let btnCancel = UIBarButtonItem(title: "취소", style: .done, target: self, action: #selector(onPickCancel))
        toolBar.setItems([btnCancel , space , btnDone], animated: true)
        toolBar.isUserInteractionEnabled = true
        mainView.pickerViewTextfield.inputAccessoryView = toolBar
    }
    
    @objc func onPickDone(_ sender: UIDatePicker) {
        mainView.pickerViewTextfield.resignFirstResponder()
    }
    @objc func onPickCancel() {
        mainView.pickerViewTextfield.resignFirstResponder()
    }
    
}

//MARK: - PickerVIewDelegate && DataSource
extension AddEventViewControleer: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return viewModel.cityList.city.count
        } else {
            let filterData = viewModel.cragList.cragList.filter { $0.cityCode == viewModel.cityCode.value }
            return filterData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(viewModel.cityList.city[row].city)"
        } else {
            let filterData = viewModel.cragList.cragList.filter { $0.cityCode == viewModel.cityCode.value }
            return "\(filterData[row].name)"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            viewModel.cityCode.value = viewModel.cityList.city[row].code
            pickerView.reloadComponent(1)
        } else {
            let filterData = viewModel.cragList.cragList.filter { $0.cityCode == viewModel.cityCode.value }
            mainView.inputTitleView.outputLabel.text = "\(filterData[row].name)"
            viewModel.targetCrag.value = filterData[row].idCode
        }
    }
}
