

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

### 👨🏻‍🤝‍👨🏼 Introduction

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

### 📌 Coding Convention

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

### 🧑‍💻 Git-Commit Message Convention

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

### 🗂 Foldering

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

### 🛠 IDE and Library Used

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

### 📱 App Specification

####   Splash

##### 	images

##### 	descriptions

####   Login/Sign In

##### 	images

##### 	descriptions

####   Home

##### 	images

##### 	descriptions

####   Store

##### 	images

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjnnpqbtbj30n01ds1kx.jpg" alt="storelist" style="zoom:20%; margin-right:10px;" align="left" width="20%" margin-right="5px" padding-right="5px"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjnpdk2p4j30n01dsk8a.jpg" alt="selectcollege" style="zoom:20% margin-right:10px; float:auto;" width="20%" margin-right="5px" padding-right="5px"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjnpq7f26j30n01dsdx1.jpg" alt="storedetail-fav" style="zoom:20%; float:auto; margin-right:5px;" width="20%" margin-right="5px" padding-right="5px"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjntaknejj30n01dsqos.jpg" alt="mapview" style="zoom:20%; float:right;" width="20%" margin-right="5"/>

##### 	descriptions

- display a store list for user in StoreView using UICollectionView. Back button in navigation bar is linked HomeView whitch is first item of tabbar. and map button in right side of the navigation bar presents mapview the cell is disabled when the store is closed. University selection view present university table view and can be changed by selection of tableview. Every cells are touchable and push navigationcontroller of section 3 below. when the favorate button of collectionviewcell is cliked, client send a boolean value to server and refresh the collectionview.
- select college option to change current college information and a store list along to it using UITableView
- display the store details when a store is clicked on the 1st view. favBtn is activated with blue color and post to server that the store is added to a favorite list when the button is clicked. push to the waiting list view of a order function using by UINavigationController when the orderBtn is clicked.
- display the map view when a map button on the 1st view is clicked using Naver Map API with CocoaPod 'NMapsMap'. This view shows stores nearby the selected college using by NMGLatLng on NMapsMap and a marker. markers become bigger and a information window appear over the marker when marker is clicked. dismiss to presenting view by presenting modally and push to storeDetailView using by UINavigationContoroller when the information window is clicked.

####   Order

##### 	images

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo2y6ykhj30n01dsjue.jpg" alt="order-selectstore" style="zoom:20%;" width="20%" margin="5"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo3dqda4j30n01dswhe.jpg" alt="order-selectstore2" style="zoom:20%;" width="20%" margin="5"/>

##### 	descriptions

- third item of tabbar presents Order view. which find stores to order printing service using UITableView. there are three sections, recentStore, favorateStore and nearbyStores. when any cell is selected, the view below appears from bottom and there is a button links to submit view.
- display submit view when a store is clicked on the 1st view by modifying layout constraints of the view.

####   Status

##### 	images

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo74103uj30n01dsjwt.jpg" alt="orderstatus" style="zoom:20%;" width="20%" margin="5"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo7eb9c1j30n01ds0x8.jpg" alt="orderstatus-popup" style="zoom:20%;" width="20%" margin="5"/>

##### 	descriptions

- display current order status of three status('order', 'printing', 'done') and display different progress bar images along to the status using UITableView. cancelOrderBtn is shown only when the status is 'order' and completePickUpBtn is activate only when the status is 'done'. statusCells on the 'done' status disappear when completePickUpBtn is clicked.
- popupView is presented when cancelOrderBtn is clicked on the first view by presenting modally with modifying background color and opacity of the popupView. nothing happened and dismiss to the presenting view when denyingBtn is clicked. But when confirmBtn is clicked, the clicked cell on the first view disappears.

####   My Page

##### 	images

##### 	descriptions

------

### 🧾 App Functions and Developer Commentaries



| Primary Function | Details                 | Status | Developer |
| :--------------- | :---------------------- | :----: | :-------: |
| Splash           |                         |  Todo  |  Taehoon  |
| Login            |                         |  Todo  |  Hansol   |
| Sign In          |                         |  Todo  |  Taehoon  |
|                  | double check            |  Todo  |  Taehoon  |
|                  | sign in                 |  Todo  |  Taehoon  |
| Home             |                         |  Todo  |  Taehoon  |
|                  | summary of order status |  Todo  |  Taehoon  |
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
|                  | upload files            |  Todo  |  Taehoon  |
|                  | select options          | Doing  |  Hansol   |
|                  | pay credits             |  Todo  |  Hansol   |
| Order Status     |                         |        |  Hansol   |
|                  | order status view       |  Done  |  Hansol   |
|                  | order details view      |  Done  |  Hansol   |
| My page          |                         |        |  Hansol   |
|                  | my profile              |  Todo  |  Hansol   |
|                  | logout                  |  Todo  |  Hansol   |
|                  | engine view             |  Todo  |  Hansol   |
|                  | Settings                |  Todo  |  Hansol   |
|                  |                         |        |           |
|                  |                         |        |           |



------

### 🏃 Challenges and Something New



------

### 📬 About

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

