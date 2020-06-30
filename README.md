# Booster-iOS
### Table of Contents

- [Coding Convention](#coding-convention)
  - [layout](#layout)
  - [naming rules](#naming-rules)
- [Foldering](#Foldering)
- IDE and Library used
- APP Specification
- APP Functions and Developer Commentaries
- Challenges and Something New
- About



### Coding Convention

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

#### Naming

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

  ```swif
  protocol MyCellDelegate {
    func myCellWillPresent(_ cell: MyCell)
    func myCell(_ cell: MyCell, didTapFollowButtonWith user: User)
  }
  ```

  - Not preferred example

  ```swif
  protocol MyCellDelegate {
    func willPresent(_ cell: MyCell)
    func myCell(_ cell: MyCell, didTapFollowButtonWith user: User)
  }
  ```

  

#####   Variable naming

- use lowerCamelCase in a variable name.

#####   Constant naming

- use lowerCamelCase in a constant name.

