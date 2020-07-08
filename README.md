

# 🚀 We Are BOOSTER iOS🚀

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

######   > BOOSTER - We print convenience rapidly!!

> 26th SOPT Appjam team 'BOOSTER'
>
> Faster / Easier / Together
>
> 2020.06 ~ ing

####  Developers

- 김태훈
- 노한솔

####   Workflow

![workflow](https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjlelvhagj31hc0u012b.jpg)

####   Core Value

- Faster
- Easier
- Together

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

### Foldering

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjlw2thbdj30ew0wch5e.jpg" alt="foldering" style="zoom:50%;" height="20%"  />

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

##### 	descriptions

####   Login/Sign In

##### 	images

##### 	descriptions

####   Home

##### 	images

##### 	descriptions

####   Store

##### 	images

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjnnpqbtbj30n01ds1kx.jpg" alt="storelist" style="zoom:20%;" align="left" width="20%" margin="5" right-padding="5"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjnpdk2p4j30n01dsk8a.jpg" alt="selectcollege" style="zoom:20%; float:auto;" width="20%" margin="5" right-padding="5"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjnpq7f26j30n01dsdx1.jpg" alt="storedetail-fav" style="zoom:20%; float:auto;" width="20%" margin="5" right-padding="5"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjntaknejj30n01dsqos.jpg" alt="mapview" style="zoom:20%; float:right;" width="20%" margin="5"/>

##### 	descriptions

- display a store list for user in StoreView using UICollectionView
- select college option to change current college information and a store list along to it using UITableView
- display the store details when a store is clicked on the 1st view. favBtn is activated with blue color and post to server that the store is added to a favorite list when the button is clicked. push to the waiting list view of a order function using by UINavigationController when the orderBtn is clicked.
- display the map view when a map button on the 1st view is clicked using Naver Map API with CocoaPod 'NMapsMap'. This view shows stores nearby the selected college using by NMGLatLng on NMapsMap and a marker. markers become bigger and a information window appear over the marker when marker is clicked. dismiss to presenting view by presenting modally and push to storeDetailView using by UINavigationContoroller when the information window is clicked.

####   Order

##### 	images

<img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo2y6ykhj30n01dsjue.jpg" alt="order-selectstore" style="zoom:20%;" width="20%" margin="5"/><img src="https://tva1.sinaimg.cn/large/007S8ZIlgy1ggjo3dqda4j30n01dswhe.jpg" alt="order-selectstore2" style="zoom:20%;" width="20%" margin="5"/>

##### 	descriptions

- find stores to order printing service using UITableView
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

### App Functions and Developer Commentaries



| Primary Function | Details                 | Status | Developer |
| :--------------- | :---------------------- | :----: | :-------: |
| Splash           |                         |  Todo  |   태훈    |
| Login            |                         |  Todo  |   한솔    |
| Sign In          |                         |  Todo  |   태훈    |
|                  | double check            |  Todo  |   태훈    |
|                  | sign in                 |  Todo  |   태훈    |
| Home             |                         |  Todo  |   태훈    |
|                  | summary of order status |  Todo  |   태훈    |
|                  | tabbar                  |  Done  |   태훈    |
| Search           |                         |  Done  |   Both    |
|                  | display stores          |  Done  |   태훈    |
|                  | select college          |  Done  |   태훈    |
|                  | map view                |  Done  |   한솔    |
|                  | add my favorite         |  Done  |   한솔    |
|                  | store details view      |  Done  |   한솔    |
| Order            |                         |        |   Both    |
|                  | select a store          |  Done  |   태훈    |
|                  | waiting list            |  Done  |   태훈    |
|                  | upload files            |  Todo  |   태훈    |
|                  | select options          | Doing  |   한솔    |
|                  | pay credits             |  Todo  |   한솔    |
| Order Status     |                         |        |   한솔    |
|                  | order status view       |  Done  |   한솔    |
|                  | order details view      |  Done  |   한솔    |
| My page          |                         |        |   한솔    |
|                  | my profile              |  Todo  |   한솔    |
|                  | logout                  |  Todo  |   한솔    |
|                  | engine view             |  Todo  |   한솔    |
|                  | Settings                |  Todo  |   한솔    |
|                  |                         |        |           |
|                  |                         |        |           |



------

### Challenges and Something New



------

### About

