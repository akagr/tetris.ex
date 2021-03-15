defmodule Tetris.Brick do
  defstruct name: :o,
            location: {40, 0},
            rotation: 0,
            reflection: false

  @doc """
  Returns a new brick with default values.
  """
  @spec new() :: %Tetris.Brick{}
  def new(), do: __struct__()

  @doc """
  Returns a new brick with random values.
  """
  @spec new_random() :: %Tetris.Brick{}
  def new_random() do
    %__MODULE__{
      name: random_name(),
      location: {40, 0},
      rotation: random_rotation(),
      reflection: random_reflection()
    }
  end

  @doc """
  Returns a random brick type. We use atoms for
  similarly shaped bricks to represent them.
  """
  @spec random_name() :: atom()
  def random_name() do
    ~w(i l z o t)a |> Enum.random()
  end

  @doc """
  Returns a random rotation in degrees. Rotations are
  multiples of 90.
  """
  @spec random_rotation() :: number()
  def random_rotation() do
    [0, 90, 180, 270] |> Enum.random()
  end

  @doc """
  Reflectiion represents whether a brick is flipped
  horizontally or not.
  """
  @spec random_reflection() :: boolean()
  def random_reflection() do
    [true, false] |> Enum.random()
  end

  @doc """
  Moves a brick one unit down.

  Example:

      iex> brick = %Tetris.Brick{name: :o, location: {0, 0}, rotation: 0, reflection: false}
      iex> brick |> Tetris.Brick.down()
      %Tetris.Brick{name: :o, location: {0, 1}, rotation: 0, reflection: false}

  """
  @spec down(%Tetris.Brick{}) :: %Tetris.Brick{}
  def down(%{location: {x, y}} = brick) do
    %{brick | location: {x, y + 1}}
  end

  @doc """
  Moves a brick one unit left.

  Example:

      iex> brick = %Tetris.Brick{name: :o, location: {0, 0}, rotation: 0, reflection: false}
      iex> brick |> Tetris.Brick.left()
      %Tetris.Brick{name: :o, location: {-1, 0}, rotation: 0, reflection: false}

  """
  @spec left(%Tetris.Brick{}) :: %Tetris.Brick{}
  def left(%{location: {x, y}} = brick) do
    %{brick | location: {x - 1, y}}
  end

  @doc """
  Moves a brick one unit right.

  Example:

      iex> brick = %Tetris.Brick{name: :o, location: {0, 0}, rotation: 0, reflection: false}
      iex> brick |> Tetris.Brick.right()
      %Tetris.Brick{name: :o, location: {1, 0}, rotation: 0, reflection: false}

  """
  @spec right(%Tetris.Brick{}) :: %Tetris.Brick{}
  def right(%{location: {x, y}} = brick) do
    %{brick | location: {x + 1, y}}
  end

  @doc """
  Spins a brick clockwise in 90 degree increments.

  Example:

      iex> brick = %Tetris.Brick{name: :o, location: {0, 0}, rotation: 270, reflection: false}
      iex> brick |> Tetris.Brick.spin_90()
      %Tetris.Brick{name: :o, location: {0, 0}, rotation: 0, reflection: false}
  """
  @spec spin_90(%Tetris.Brick{}) :: %Tetris.Brick{}
  def spin_90(%{rotation: degrees} = brick) do
    %{brick | rotation: rem(degrees + 90, 360)}
  end
end
