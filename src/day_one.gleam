import gleam/string
import gleam/list
import gleam/result
import gleam/int

pub fn part_one(input: String) -> Int {
  input
  |> string.split(on: "\n")
  |> list.fold(0, fn(acc, el) -> Int {
    let elements =
      el
      |> string.split(on: "")
      |> list.filter(is_digit)
    let first =
      elements
      |> list.first()
      |> result.unwrap("0")
    let last =
      elements
      |> list.last()
      |> result.unwrap("0")
    let digit = parse_unwrap_int(first <> last)
    acc + digit
  })
}

fn parse_unwrap_int(string: String) -> Int {
  string
  |> int.parse()
  |> result.unwrap(0)
}

fn is_digit(char: String) -> Bool {
  "1234567890"
  |> string.contains(char)
}
