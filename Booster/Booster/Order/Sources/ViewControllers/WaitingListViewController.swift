//
//  WaitingListViewController.swift
//  Booster
//
//  Created by 김태훈 on 2020/07/06.
//  Copyright © 2020 kimtaehoon. All rights reserved.
//

import UIKit
import MobileCoreServices
import QuickLookThumbnailing
class WaitingListViewController: UIViewController {

  var orderIdx:Int = -1
  var storeInfo:simpleStoreData?
  
  
  @IBOutlet weak var storeName: UILabel!
  @IBOutlet weak var storeAddress: UILabel!
  var tmpImg = UIImage()
  var fileList:[FileInformation] = []
  var fileDataList :[fileData] = []
  //var file = FileInformation(fileImg: UIImage(), fileName: "")
  @IBOutlet weak var totalPrice: UILabel!
  @IBOutlet weak var priceLabel: UILabel!
  @IBOutlet weak var waitingListCollectionView: UICollectionView!
  override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    setWaitingListCV()
    storeName.text = storeInfo?.store_name
    storeAddress.text = storeInfo?.store_address
    
    waitListService.shared.waitlist(orderIdx: orderIdx){
      networkResult in
      switch networkResult{
      case .success(let data):
        guard let data = data as? waitCellData else {return}
        var tempFilelist:[fileData] = []
        if let file =  data.file_info{
          for i in 0..<file.count{
            tempFilelist.append(fileData(file_idx: file[i].file_idx, file_name: file[i].file_name, file_extension: file[i].file_extension, file_path: file[i].file_path))
          }
          self.fileDataList = tempFilelist
          tempFilelist.removeAll()
        }
        else{
          self.fileDataList.removeAll()
          tempFilelist.removeAll()
        }
        self.totalPrice.text = String(data.order_price)
      case .requestErr(let messgae) : print(messgae)
      case .networkFail: print("networkFail")
      case .serverErr : print("serverErr")
      case .pathErr : print("pathErr")
      }
    }
  }
  func goBackToStoreSelection(){
    for i in 0..<fileList.count{
      clearFileDir(filename: fileList[i].fileName)
    }
    self.navigationController?.popViewController(animated: true)

  }
  
  @IBAction func closeBtn(_ sender: Any) {
    goBackToStoreSelection()

  }
  @IBAction func cangeCurrentStore(_ sender: Any) {
    goBackToStoreSelection()
  }
  @IBAction func selectOption(_ sender: Any) {
    let orderHsStoryboard = UIStoryboard.init(name:"OrderHs",bundle: nil)
    guard let optView = orderHsStoryboard.instantiateViewController(identifier: "OptionViewController") as? OrderHsViewController else {return}
    self.navigationController?.pushViewController(optView, animated: true)
  }
  @IBAction func goPayView(_ sender: Any) {
    let orderHsStoryboard = UIStoryboard.init(name:"OrderHs",bundle: nil)
    guard let payView = orderHsStoryboard.instantiateViewController(identifier: "PayViewController") as? PayViewController else {return}
    self.navigationController?.pushViewController(payView, animated: true)
  }
  @IBAction func goShowOptionView(_ sender: Any) {
    let orderHsStoryboard = UIStoryboard.init(name:"OrderHs",bundle: nil)
    guard let showOptionView = orderHsStoryboard.instantiateViewController(identifier: "showOptionViewController") as? ShowOptionViewController else {return}
    showOptionView.modalPresentationStyle = .overCurrentContext
    present(showOptionView, animated: false, completion: nil)
    
  }
  
  func setWaitingListCV(){
    waitingListCollectionView.delegate = self
    waitingListCollectionView.dataSource = self
  }
  @IBOutlet weak var orderBtnAppear: NSLayoutConstraint!
  func orderViewAppear(){
    self.view.layoutIfNeeded()
    orderBtnAppear.constant = 162
  }
  func orderViewDisappear(){
    orderBtnAppear.constant = 0
  }
  
  func clearFileDir(filename:String){
     
     let curDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)

     let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
     
     let file = dir.appendingPathComponent(filename)
     if FileManager.default.fileExists(atPath: dir.path){
       print("파일이 있다네요")
       do {
         try FileManager.default.removeItem(at: file)
       }
       catch {
         print("삭제가 안되나요")
       }
     }
   }

//  func thumbNailGenerator(_ fileURL:URL, thumbnailSize:CGSize) -> UIImage?{
//
//  }
  /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  func getFileFromLocal(){
    let documentPicker = UIDocumentPickerViewController(documentTypes: ["com.apple.iwork.pages.pages", "com.apple.iwork.numbers.numbers", "com.apple.iwork.keynote.key","public.image", "com.apple.application", "public.item", "public.content", "public.audiovisual-content", "public.movie", "public.audiovisual-content", "public.video", "public.audio", "public.text", "public.data", "public.zip-archive", "com.pkware.zip-archive", "public.composite-content"], in: .import)
    documentPicker.delegate = self
    documentPicker.allowsMultipleSelection = false
    self.present(documentPicker, animated: true)
    
//    print(fileList)
  }
}
extension WaitingListViewController:UIDocumentPickerDelegate {
  func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
    guard let selectedFileURL = urls.first else {
      return
    }
    let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let sandboxFileURL = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
    if FileManager.default.fileExists(atPath: sandboxFileURL.path) {
      print("Already exists!")
      let alert = UIAlertController(title: "", message: "이미 가져온 파일입니다.", preferredStyle: UIAlertController.Style.alert)
        let confirm = UIAlertAction(title: "확인", style: .default, handler : nil)
      
      alert.addAction(confirm)
      present(alert,animated: true)
      }
    else {
      do {
        try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
      }
      catch {
        print("에러났다이거봐라 : \(error)")
      }
      //여기서 파일 서버에 업로드
      let size:CGSize = CGSize(width: 38, height: 51)
      let scale = UIScreen.main.scale
      let request = QLThumbnailGenerator.Request(fileAt: sandboxFileURL, size: size, scale: scale, representationTypes: .thumbnail)
      let generator = QLThumbnailGenerator.shared
      var thumbNail = UIImage()
      print("local에서 불러온 파일 : ")
//      print(sandboxFileURL)
      print(sandboxFileURL.lastPathComponent)
      //파일 업로드 하기
      do {
         let data = try Data(contentsOf: sandboxFileURL)
        uploadFileService.shared.uploadfile(fileData: sandboxFileURL, orderIdx: 20){
          networkResult in
          switch networkResult{
          case .success(let fileIndexData) :
            
            guard let fileIndexData = fileIndexData as? fileIdx else {return}

            
            case .requestErr(let messgae) : print(messgae)
            case .networkFail: print("networkFail")
            case .serverErr : print("serverErr")
            case .pathErr : print("pathErr")
          }
        }
        
      }
      catch {
        print("fail")
      }
      
      
      
      
      
      generator.generateRepresentations(for: request) { (thumbnail, _, error) in
        DispatchQueue.main.async {
          if thumbnail != nil{

              thumbNail = thumbnail!.uiImage
              print("썸네일 있는 파일")
            let filename:String = String(sandboxFileURL.lastPathComponent.split(separator: ".")[0])
            let fileExtension:String = String(sandboxFileURL.lastPathComponent.split(separator: ".")[1])
            
            self.fileDataList.append(fileData(file_idx: -1, file_name: filename, file_extension: fileExtension, file_path: sandboxFileURL))
              self.waitingListCollectionView.reloadData()
            
          }
          else if  thumbnail == nil || error != nil{

              print("썸네일 없는 파일")
              print("error : \(String(describing: error))")
            
            let filename:String = String(sandboxFileURL.lastPathComponent.split(separator: ".")[0])
            let fileExtension:String = String(sandboxFileURL.lastPathComponent.split(separator: ".")[1])
             self.fileDataList.append(fileData(file_idx: -1, file_name: filename, file_extension: fileExtension, file_path: sandboxFileURL))
              self.waitingListCollectionView.reloadData()
            //self.tmpImg = thumbnail?.uiImage as! UIImage
            
          }
        }
      }
    }

//    guard let url = sandboxFileURL else {
//      assert(false, "The URL can't be nil")
//      return
//    }
//    guard let url = Bundle.main.url(forResource: "test", withExtension: "pdf") else {
//      return
//    }
    

//    guard let test = self.storyboard?.instantiateViewController(withIdentifier: "optionViewTest") else {return}
//    self.present(test,animated: true)
  }
}

extension WaitingListViewController:UICollectionViewDelegate{
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return fileDataList.count + 1
  }
  
}

extension WaitingListViewController:UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    
    
    if fileDataList.count == 0 {
       orderViewDisappear()
    }
    else {
      orderViewAppear()
    }
    
    if indexPath.row == fileDataList.count{
      guard let fileAdd:AddFileCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddFileCollectionViewCell.identifier, for: indexPath)as? AddFileCollectionViewCell else {
        return UICollectionViewCell()}
      
      
      fileAdd.addFileBtn.tag = indexPath.row
      fileAdd.addFileBtn.addTarget(self, action: #selector(getFile(sender:)), for: .touchUpInside)
      return fileAdd
      
      
    }
    else{
      guard let fileCell:WaitCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: WaitCollectionViewCell.identifier, for:indexPath) as? WaitCollectionViewCell else {
          return UICollectionViewCell()}
      fileCell.fileName.text = "ddd"
      //fileCell.fileName.text = fileDataList[indexPath.row].file_name
      //fileCell.preViewImg.setImage(fileList[indexPath.row].fileImg, for: .normal)
      
        fileCell.deleteCell.tag = indexPath.row
        fileCell.deleteCell.addTarget(self, action: #selector(deleteCell(sender:)), for: .touchUpInside)
      return fileCell

    }
    

  }
  @objc func getFile(sender:UIButton){
    getFileFromLocal()
  }
  @objc func deleteCell(sender: UIButton){
    let alert = UIAlertController(title: "", message: "파일을 삭제하겠습니까?", preferredStyle: UIAlertController.Style.alert)
    let no = UIAlertAction(title: "Cancel", style: .default, handler : nil)
    let yes = UIAlertAction(title: "OK", style: .default) { (action) in
      self.clearFileDir(filename: self.fileDataList[sender.tag].file_name)
      self.fileDataList.remove(at: sender.tag)
      self.waitingListCollectionView.reloadData()
      
    }
    alert.addAction(yes)
    alert.addAction(no)
    present(alert,animated: true, completion: nil)
  }
  

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

      //print("파일 불러오기")

      //collectionView.insertItems(at: [indexPath])
      //collectionView.reloadItems(at:collectionView.indexPathsForVisibleItems)
      //collectionView.reloadData()
    if indexPath.row == fileDataList.count {
      getFileFromLocal()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexpath:IndexPath) ->UICollectionReusableView{
    var header : WaitCollectionViewHeader!
    if kind == UICollectionView.elementKindSectionHeader{
      header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "waitingHeader", for: indexpath) as? WaitCollectionViewHeader
      header.waitingHeaderTitle.text = "파일 목록"

    }
    return header
    
  }
}
extension WaitingListViewController:UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width:self.view.frame.size.width
      , height:self.view.frame.size.width * 73.0 / 375.0)
  }
  func collectionView(_ collectionView: UICollectionView,
  layout collectionViewLayout: UICollectionViewLayout,
  insetForSectionAt section: Int) -> UIEdgeInsets{
    if section == 0 {
    return UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0)
    }
    else{
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
}
