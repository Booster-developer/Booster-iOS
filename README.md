

# Booster-iOS

### Table of Contents

- [Coding Convention](#coding-convention)
  - [Layout](#layout)
  - [Naming rules](#naming-rules)
  - [Comment](#comment)
  - [Else](#else)
- [Foldering](#foldering)
  - [Functional](#functional)
  - [API_and_Fonts](#api_and_fonts)
  - [Models_and_Extensions](#models_and_extensions)
- [IDE and Library used](#ide-and-library-used)
- [APP Specification](#app-specification)
- [APP Functions and Developer Commentaries](#app-functions-and-developer-commentaries)
- [Challenges and Something New](#challenges-and-something-new)
- [About](#about)



### Coding Convention

  based on [API Design Guidelines](https://swift.org/documentation/api-design-guidelines/). Some key rules are below.

------

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

- 


### Foldering

#### API_and_Fonts
Commonly used API and Font related files are managed in this folder
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
