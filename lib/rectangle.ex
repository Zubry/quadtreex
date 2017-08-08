defmodule Rectangle do
  use Bitwise
  defstruct [:width, :height, x: 0, y: 0]

  def create([ x: x, y: y, width: width, height: height ]) do
    %Rectangle{ x: x, y: y, width: width, height: height }
  end

  def midpoint(rectangle) do
    %{
      x: rectangle.x + (rectangle.width >>> 1),
      y: rectangle.y + (rectangle.height >>> 1)
    }
  end

  def collides?(a, b) do
    a.x < b.x + b.width and a.x + a.width > b.x and a.y < b.y + b.height and a.height + a.y > b.y
  end
end
