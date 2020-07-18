

# 🚀 We Are BOOSTER iOS🚀

![workflow](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjqq2rcgjj31hc0u0q6p.jpg)

### Table of Contents

- [Introduction](#introduction)
  
  - [Developers](#developers)
  - [Workflow](#workflow)
  - [Core Value](#core_value)
  
- [Coding Convention](#coding-convention)
  
  - [Layout](#layout)
  - [Naming rules](#naming-rules)
  - [Comment](#comment)
  - [Else](#else)
  
- [Git-Commit Message Convention](#git-commit_message_convention)

  - [Commit Style](#commit_style)
  - [Content](#content)

- [Foldering](#foldering)
  
  - [API_and_Fonts](#api_and_fonts)
  - [Models_and_Extensions](#models_and_extensions)
  - [Functional](#functional)
  
- [IDE and Library used](#ide-and-library-used)

- [APP Specification](#app-specification)

  - [Splash](#splash)
  - [Login/Sign In](#login/sign_in)
  - [Home](#home)
  - [Store](#store)
  - [Order](#order)
  - [Status](#status)
  - [My Page](#my_page)

- [APP Functions and Developer Commentaries](#app-functions-and-developer-commentaries)

- [Challenges and Something New](#challenges-and-something-new)

- [About](#about)
  
  - [Copyright Statement](#copyright_statement)
  
    

------

### Introduction

####   > BOOSTER - We print convenience rapidly!! <

> 26th SOPT Appjam team 'BOOSTER'
>
> Faster / Easier / Together
>
> 2020.06 ~ ing

####   Developers

##### 	Taehoon Kim

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggju1xbrsjj31400u07rl.jpg" alt="th" style="zoom:25%;" height="200px" width="150px"/>

- INFP
- [iAmSomething](#https://github.com/iAmSomething)
- implement : SplashView, SignInView, HomeView, SearchView, OrderView

#####     Hansol Noh

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjql14r81j30u0140am0.jpg" alt="하이" style="zoom:25%;" float="left" height="200px" width="150px" />

- ENTP
- [hansolnoh95](#https://github.com/hansolnoh95)
- Implement : LoginView, SearchView, OrderView, OrderStatusView, MyPageView

####   Workflow

![workflow](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjqqii5ezj30u016harm.jpg)

####   Core Value

- ##### Faster : You don't have to be late on class for long, boring printing process. Go faster and take a look your lecture notes once more!

- ##### Easier : You don't have to consume your energy in front of printing computers and printers anymore! Just upload your files with your mobile phone on the way you go to your school:)

- ##### Together : We know your difficulties of your college life,,, cuz we are students as well. So, why don't we go forward together?! 

------

### Coding Convention

  based on [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/). Some key rules are below.

#### Layout

#####   Indentation and Spacing

- use 2 spaces for indentation.![스크린샷 2020-06-30 오후 5.17.55](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggae1yvl1sj317g0hun3h.jpg)

- use a whitespace( ) not in front of but only after colon(:).

  - example 

    `let name: String`

#####   Line breaking

- if max length of a line exceeded, line breaking should be after last word is finished.

- if max length of a line exceeded during function calling, line breaking should be based on parameters. cf, if parameters have more than double closures, line must be breaked.

- nothing except last closure can be on same position with first letter of block.

  - example

    ```swift
    guard let pvc = self.storyboard?.instantiateViewController(
    	identifier="secondVC") as? SecondViewController
    	else {return}
    ```

#####   Max length of a line

- a line should not be over 99 letters.![스크린샷 2020-06-30 오후 5.20.32](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggae2raqjcj30to0ba0uu.jpg)

#####   Blank line

- there should not be whitespaces in blank lines.
- every last line of files should be a blank line.

#####   Import rules

- module import should be sorted internal to external(third party), and alphabet.

------

#### Naming rules

#####   Common

- do not include needless words.
- use `camelCase` not `snake_case`.
- abbreviation should be `UPPERCASE` except being first letter of a word.
- use name based on roles.

#####   Class naming

- use UpperCamelCase in a class name.
- no prefix in class name.

#####   Function naming

- use lowerCamelCase in a function name.

- do not use get, set in function name if possible.

- prefix

  - will : supposed to do an action.
  - did : after a certain action.
  - should : returns a bool value.

- use protocolName in delegate functions.

  - preferred example

  ```swift
  protocol MyCellDelegate {
    func myCellWillPresent(_ cell: MyCell)
    func myCell(_ cell: MyCell, didTapFollowButtonWith user: User)
  }
  ```

  - not preferred example

  ```swift
  protocol MyCellDelegate {
    func willPresent(_ cell: MyCell)
    func myCell(_ cell: MyCell, didTapFollowButtonWith user: User)
  }
  ```

  

#####   Variable naming

- use lowerCamelCase in a variable name.

#####   Constant naming

- use lowerCamelCase in a constant name.

------

#### Comment

- use triple slash(///) for comment

- do not use comment type like C (/* ... */) .

  - preferred example

  ```swift
  /// MARK - IBOutlets
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var nameLabel: UILabel!
  ```

  - not preferred example

  ```swift
  /* these are IBOutlets
      that are connected with objects on storyboard */
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var nameLabel: UILabel!
  ```

- avoid block comments inline with code.

------

#### Else

- use then to initialize properties of variables during declaration.

  - example

  ```swift
  let nameLabel = UILabel().then{
    $0.backgroundColor = .white
    $0.textColor = .blue
    $0.text = "world"
  }
  ```

------

### Git-Commit Message Convention

####   Commit Type

- feat : add new features
- fix : modify some errors or bugs
- docs : modify documents
- style : format code style or nothing is changed

####   Content

- content should not be over 50 letters and starts with Capital letter.
- do not use past tense but use present tense.
  - preferred example : Fix HomeView
  - not preferred example : Fixed HomeView

------

### Foldering

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjlw2thbdj30ew0wch5e.jpg" alt="foldering" style="zoom:50%;" height="700px" width="300px" />

#### API_and_Fonts
Commonly used API and Font related files are managed in this folder

- API: ServerAPI, NaverMapAPI(NMapsMap)
- Fonts: Apple SD Gothic Neo

#### Models_and_Extensions
Commonly used Model and Extension related files are managed in this folder
#### Functional
There are 5 major functions in this project
```
1. Home
2. Search
3. Order
4. Status
5. MyPage
6. Login and Signin
```
Groups are devided by function and each groups has sources and resources folders.

##### Sources
These files can included in sources folder

- Viewcontrollers
- Views
- Cells
- APIServices
- Models

##### Resources
These files can included in resources folder

- Storyboards

------

### IDE and Library Used

####   IDE

- Swift 5
- Xcode 11.5
- CocoaPod 1.9.3

####   Library Used

- Alamofire 4.8.2 : to communicate with server
- Kingfisher 5.0 : to communicate with server
- NMapsMap : to implement a map view
- SwiftGifOrigin 1.7.0 : to implement a splash

------

### App Specification

####   Splash

##### 	images

![스플래시](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggu93my9y4g303c06mte5.gif)

##### 	descriptions

- Launchscreen.storyboard can't use thirdparty classes like Lottie of Airbnb. In order to make custom splash, SplashViewController is implemented using Lottie. Lottie is library of managing animations using .json files of images like you can see above.

- The application start with Splash view controller and present Log-in view after splash animation is ended.

- splash json file can't handle every devices because they have their own screen size. so, It have to be loaded by different file for different UIScreen size. it was important to figure out boundary of view size by swift programmally.

  ``` swift
    func getLayoutofUserDevice(){
      if(UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 667){ // i8
        self.splashJsonName = "splash_i8"
      }
      else if(UIScreen.main.bounds.size.width == 414 && UIScreen.main.bounds.size.height == 896){// 11
        self.splashJsonName = "splash_i11"
        
      }
      else if(UIScreen.main.bounds.size.width == 375 && UIScreen.main.bounds.size.height == 812) { // xs
        self.splashJsonName = "splash_xs"
      }
    }
  ```

####   Login/Sign Up

##### 	images

![](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggu9wi3g2gj304m09ygli.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-25](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggu9wwn7fpj304m09yglv.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-24](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggu9wlg3jtj304m09yjrn.jpg)



##### 	descriptions

- After splash animation ended, login view is loaded. in login view, there are two textfield for id / password. Log in button initiate networking with server py POST. With empty textfield, Log in button shows alert and message.
- In sing up view, Name, Id, password and university information is needed to activate Sign up button. Every textfield are checked if it is empty when any textfield ended typing or any buttons are clicked.
- After insert ID textfield, ID check button must be clicked. ID Check button communicate with server by POST action and check if there is a same ID in server. if there is no same ID in server field, small label below textfield will shows that saying it is okay to continue sign up. if there is same ID in server, small label below textfield will notice that there is same ID in server, and textfiled will be cleared.
- After that, In pw field, two textfiled must be filled in same text. Texts are checked when one of two textfiled ended typing. If two text are not same, small label below second textfield will show that pw is incorrect.
- University must selected to locate position of users. 
- After all buttons are clicked, and Every textfield are filled properly, Sign up button will activate. with Sign up button, client send user information to server and recieve results.

####   Home

##### 	images

![KakaoTalk_Photo_2020-07-17-20-26-41-23](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguaa9m97oj304m09y0tu.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-22](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguaa904rgj304m09y0t8.jpg)



##### 	descriptions

- After log in, the First view of Tabbar is Home view.

- When Home view is loaded, communication with server is initiate in same time. and get informations that will be showed in Home view. 

- There are two values are get from server, user name and current status.

- By status information, Lottie Animation is changed and Label is also changed by status information like below code .

  ```swift
          switch (self.statusIdx ?? 0){
          case 2:
            self.progressLabel?.text = "인쇄 진행 중이에요!"
            self.jsonName = self.deviceInfo + "_2"
          case 3:
            self.progressLabel?.text = "인쇄가 완료되었어요 :)"
            self.jsonName = self.deviceInfo + "_3"
            
          default:
            self.progressLabel?.text = "인쇄를 시작해볼까요?"
            self.jsonName = self.deviceInfo + "_1"
          }
  ```

- Alert button in top-right corner persent current alert informations.

- in alert view, every cells have toggle image assets. if user check alert, alert image go inactive. 

####   Store

##### 	images

![KakaoTalk_Photo_2020-07-17-20-26-41-21](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguajzaoulj304m09ytah.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-17](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguak5eyh3j304m09y0tu.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-19](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguake4kt5j304m09yaby.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-20](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguaknutrfj304m09ydgw.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-16](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguakut6yxj304m09ytak.jpg)

##### 	descriptions

- display a store list for user in StoreView using UICollectionView. Back button in navigation bar is linked HomeView whitch is first item of tabbar. and map button in right side of the navigation bar presents mapview the cell is disabled when the store is closed. University selection view present university table view and can be changed by selection of tableview. Every cells are touchable and push navigationcontroller of section 3 below. when the favorate button of collectionviewcell is cliked, client send a boolean value to server and refresh the collectionview.
- select college option to change current college information and a store list along to it using UITableView
- display the store details when a store is clicked on the 1st view. favBtn is activated with blue color and post to server that the store is added to a favorite list when the button is clicked. push to the waiting list view of a order function using by UINavigationController when the orderBtn is clicked.
- display the map view when a map button on the 1st view is clicked using Naver Map API with CocoaPod 'NMapsMap'. This view shows stores nearby the selected college using by NMGLatLng on NMapsMap and a marker. markers become bigger and a information window appear over the marker when marker is clicked. dismiss to presenting view by presenting modally and push to storeDetailView using by UINavigationContoroller when the information window is clicked.

####   Order

##### 	images

![KakaoTalk_Photo_2020-07-17-20-26-41-15](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggucq0low1j304m09yweg.jpg)![KakaoTalk_Photo_2020-07-17-22-33-13](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguany08tej304m09y74r.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-13](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggucsz9jcsj304m09ya9v.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-9](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguawszg8oj304m09ydfy.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-10](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguax23r4yj304m09ywel.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-12](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguay3f5t0j304m09yt8x.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-11](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguaxvfre1j304m09yaa8.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-7](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguaxi3fqej304m09yaa9.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-8](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguax7wtmjj304m09y74i.jpg)

##### 	descriptions

- third item of tabbar presents Order view. which find stores to order printing service using UITableView.

- When view loaded, user send token to server and get store list nearby university. 3 sections are divided by favorite store, recently visited store, and all stores nearby. server give users store list and informations and 3 different sections are implemented by different arrays. 

- Every cells can be selected. when selection occurs, button appears from bottom and disappear when selection canceled.

- Selection cannot  be duplicated. Using  _selectedIndexPath, duplicated selection problems are solved. 

  ```swift
        if indexPath.compare(_selectedIndexPath!) == ComparisonResult.orderedSame{ /*이미 클릭되어 있는 cell을 클릭*/
          _selectedIndexPath = nil
          clearAllSelections()
          selectionBtnHide()
        }
        else { /*클릭되어 있지 않은 셀을 클릭할 때*/
          selectionBtnAppear()
          switch indexPath.section {
          case 0:
            cell.itemSelected(isSelected: true)
            storeNameInSelection.text = recentStorelist[indexPath.row].store_name
            
          case 1:
            cell.itemSelected(isSelected: true)
            storeNameInSelection.text = favorageStorelist[indexPath.row].store_name
            
          case 2:
            cell.itemSelected(isSelected: true)
            storeNameInSelection.text = defaultStorelist[indexPath.row].store_name
          default:
            cell.itemSelected(isSelected: true)
          }
                  
          switch _selectedIndexPath!.section {
          case 0:
            oldcell.itemSelected(isSelected: false)
          case 1:
            oldcell.itemSelected(isSelected: false)
          case 2:
            oldcell.itemSelected(isSelected: false)
          default:
            oldcell.itemSelected(isSelected: false)
          }
          _selectedIndexPath = indexPath
        }
  ```

- After click button below, the Waiting View are loaded. In waiting view, user upload file from local file manager and set a options for print

- When collection view is empty, the order button is hidden. but if user upload any file, the order button appears form bottom of view. 

- file uploading is implemented using FileManager and UIDocumentPicker. and QLThumbnailGenerator helps to make thumbnail image from file.  images extenstions are limited by pdf, jpg, png and so on. if user tring to upload exiting files, warnig alert pop up.

- After uploading files, The collectionview cells are generated automatically and it contains option check and option change buttons. 

- when option change buttons are clicked, option selection view is presented and users can make options for printing files. 

- if user don't set any options, default print use default printing options. 

- option check button present simple view of options. 

- if delete button of cell is clicked, client send a delete message to server. 

  ##### Order 

  ###### - images

![KakaoTalk_Photo_2020-07-17-20-26-41-6](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguc1a17kgj304m09y3yp.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-5](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguc1dw6sdj304m09yjrj.jpg)

- when all files uploaded, and order button clicked, payment view is loaded. 
- in this view, user can check file list and total price of print. Users can also sent a message to printing store owner.
- if payment button clicked, with a few seconds of loading, view pop up Status tab of tabbarcontrollser

####   Status

##### 	images

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo74103uj30n01dsjwt.jpg" alt="orderstatus" style="zoom:20%;" width="20%" margin="5"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo7eb9c1j30n01ds0x8.jpg" alt="orderstatus-popup" style="zoom:20%;" width="20%" margin="5"/>

##### 	descriptions

- display current order status of three status('order', 'printing', 'done') and display different progress bar images along to the status using UITableView. cancelOrderBtn is shown only when the status is 'order' and completePickUpBtn is activate only when the status is 'done'. statusCells on the 'done' status disappear when completePickUpBtn is clicked.
- popupView is presented when cancelOrderBtn is clicked on the first view by presenting modally with modifying background color and opacity of the popupView. nothing happened and dismiss to the presenting view when denyingBtn is clicked. But when confirmBtn is clicked, the clicked cell on the first view disappears.

####   My Page

##### 	images

![KakaoTalk_Photo_2020-07-17-20-26-41-3](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguc5c2549j304m09yq32.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-1](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguc5eztl9j304m09ygm1.jpg)![KakaoTalk_Photo_2020-07-17-20-26-41-4](https://tva1.sinaimg.cn/large/007S8ZIlgy1gguc5j8nzdj304m09yq33.jpg)

##### 	descriptions

- My page view shows User informations and shows use history. if rocket shape button clicked, Use history view is loaded and shows past payment
- Profile modification button is located in right side of user name. if this button clicked, modification view is loaded. In this view, password textfiled are checked when editing is ended. if every textfiled are fullfilled modification complete button began active.
- When button clicked, user send server modificated user informations and server reset user informations.

------

### App Functions and Developer Commentaries



| Primary Function | Details                 | Status | Developer |
| :--------------- | :---------------------- | :----: | :-------: |
| Splash           |                         |  Done  |  Taehoon  |
| Login            |                         |  Done  |  Hansol   |
| Sign In          |                         |  Done  |  Taehoon  |
|                  | double check            |  Done  |  Taehoon  |
|                  | sign in                 |  Done  |  Taehoon  |
| Home             |                         |  Done  |  Taehoon  |
|                  | summary of order status |  Done  |  Taehoon  |
|                  | tabbar                  |  Done  |  Taehoon  |
| Search           |                         |  Done  |   Both    |
|                  | display stores          |  Done  |  Taehoon  |
|                  | select college          |  Done  |  Taehoon  |
|                  | map view                |  Done  |  Hansol   |
|                  | add my favorite         |  Done  |  Hansol   |
|                  | store details view      |  Done  |  Hansol   |
| Order            |                         |        |   Both    |
|                  | select a store          |  Done  |  Taehoon  |
|                  | waiting list            |  Done  |  Taehoon  |
|                  | upload files            |  Done  |  Taehoon  |
|                  | select options          | Doing  |  Hansol   |
|                  | pay credits             |  Done  |  Hansol   |
| Order Status     |                         |        |  Hansol   |
|                  | order status view       |  Done  |  Hansol   |
|                  | order details view      |  Done  |  Hansol   |
| My page          |                         |        |  Hansol   |
|                  | my profile              |  Done  |  Hansol   |
|                  | logout                  |  Todo  |  Hansol   |
|                  | engine view             |  Done  |  Hansol   |
|                  | Settings                |  Todo  |  Hansol   |
|                  |                         |        |           |
|                  |                         |        |           |



------

### Challenges and Something New

Duplicated selection in multiple-section collection view.

File uploading to server by .PUT argument

Get a file thumbnail form file.

------

### About

####   Copyright Statement

```swift
/// Copyright 26th SOPT AppJam team BOOSTER
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE. THE SOFTWARE IS DEVELOPED BY iOS DEVELOPERS - Taehoon Kim, 
/// Hansol Noh - 26TH SOPT APPJAM TEAM BOOSTER.
```

