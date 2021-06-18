defmodule FP do

  alias BookShop.Validator, as: V

  def main() do
    f = bind(&V.validate_incoming_data/1, &V.validate_cat/1)
    f.(BookShop.test_data)
  end

  
  def bind(f1, f2) do
    fn(args) ->
      case f1.(args) do
        {:ok, res} -> f2.(res)
        {:error, reason} -> {:error, reason}
      end
    end
  end


  def pipeline(arg, funs) do
    Enum.reduce(funs, {:ok, arg},
      fn
        (f, {:ok, prev_res}) -> f.(prev_res)
        (_, {:error, reason}) -> {:error, reason}
      end)
  end


  def sequence([]), do: {:ok, []}
  def sequence([{:error, reason} | _]), do: {:error, reason} 
  def sequence([{:ok, val} | tail]) do
    case sequence(tail) do
      {:ok, list} -> {:ok, [val | list]}
      {:error, error} -> {:error, error}
    end
  end

end
